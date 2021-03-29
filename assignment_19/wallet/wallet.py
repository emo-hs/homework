import subprocess
import json
from dotenv import load_dotenv
import os
from constants import *
from web3 import Web3
from eth_account import Account
import bit
from bit import wif_to_key
from web3.middleware import geth_poa_middleware

load_dotenv()
mnemonic = os.getenv('MNEMONIC')

command = f'php derive -g --mnemonic="{mnemonic}" --coin=btc-test  --numderive=3 --cols=address,index,path,privkey,pubkey,pubkeyhash,xprv,xpub --format=json'

p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
output, err = p.communicate()
p_status = p.wait()

keys = json.loads(output)

command_eth = f'php derive -g --mnemonic="{mnemonic}" --coin=eth  --numderive=3 --cols=address,index,path,privkey,pubkey,pubkeyhash,xprv,xpub --format=json'
p_eth = subprocess.Popen(command_eth, stdout=subprocess.PIPE, shell=True)
output_eth, err_eth = p_eth.communicate()
p_status_eth = p_eth.wait()
keys_eth = json.loads(output_eth)

coins = {}
coins['btc-test']=keys
coins['eth']=keys_eth

w3 = Web3(Web3.HTTPProvider("http://127.0.0.1:8545"))
w3.middleware_onion.inject(geth_poa_middleware, layer=0)
def priv_key_to_account(coin, priv_key):
    if coin == ETH:
        account = Account.privateKeyToAccount(priv_key)
    elif coin == BTCTEST:
        account = bit.PrivateKeyTestnet(priv_key)
    return account

def create_tx(coin, account, to, amount):
    if coin == ETH:
        gasEstimate = w3.eth.estimateGas(
        {"from": account.address, "to": to, "value": amount})
        return {
            'chainId': w3.eth.chain_id,
            "from": account.address,
            "to": to,
            "value": amount,
            "gasPrice": w3.eth.gasPrice,
            "gas": gasEstimate,
            "nonce": w3.eth.getTransactionCount(account.address),
            
            }
    elif coin == BTCTEST:
        return bit.PrivateKeyTestnet.prepare_transaction(account.address, [(to, amount, BTC)])

def send_tx(coin, account, to, amount):
    if coin == ETH:
        tx = create_tx(coin, account, to, amount)
        signed_tx = account.sign_transaction(tx)      
        return w3.eth.sendRawTransaction(signed_tx.rawTransaction)
    elif coin == BTCTEST:
        tx = create_tx(coin, account, to, amount)
        signed = account.sign_transaction(tx)
        return bit.network.NetworkAPI.broadcast_tx_testnet(signed)
