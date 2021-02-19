# LSTM Stock Predictor

![deep-learning.jpg](Images/deep-learning.jpg)

Due to the volatility of cryptocurrency speculation, investors will often try to incorporate sentiment from social media and news articles to help guide their trading strategies. One such indicator is the [Crypto Fear and Greed Index (FNG)](https://alternative.me/crypto/fear-and-greed-index/) which attempts to use a variety of data sources to produce a daily FNG value for cryptocurrency. You have been asked to help build and evaluate deep learning models using both the FNG values and simple closing prices to determine if the FNG indicator provides a better signal for cryptocurrencies than the normal closing price data.

In this assignment, you will use deep learning recurrent neural networks to model bitcoin closing prices. One model will use the FNG indicators to predict the closing price while the second model will use a window of closing prices to predict the nth closing price.


- - -

### Files

[Closing Prices Starter Notebook](RNN/lstm_stock_predictor_closing.ipynb)

[FNG Starter Notebook](RNN/lstm_stock_predictor_fng.ipynb)

[Closing Prices Predictor Window 5](RNN/lstm_stock_predictor_fng-window.ipynb)

[FNG Prices Predictor Window 5](RNN/lstm_stock_predictor_fng-window.ipynb)

- - -

### Evaluate the performance of each model

Finally, use the testing data to evaluate each model and compare the performance.

Use the above to answer the following:

* Which model has a lower loss?
* Using closing price to predict bitcoin price has a lower loss compare to using FNG values

* Which model tracks the actual values better over time?
* Both models cannot predict actual values very well, but closing price can track the trend much better than FNG.

* Which window size works best for the model?
* The lower the window size, the better the model performance. When window size equals to one, the loss of both models are smallest 



