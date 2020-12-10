# Real Estate Analysis of Toronto from 2001 to 2016

![Toronto at night](Images/toronto.jpg)

*[Photo by James Wheeler](https://www.pexels.com/@souvenirpixels?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) | [Free License](https://www.pexels.com/photo-license/)*

Dashboard to present a visual analysis of housing market conditions in Toronto, Ontario.

The dashboard has several sections:

* Welcome - Introduction and an interactive map with average house value in Toronto
* Yearly Dwelling Types - Bar charts present the number of dwelling types per year 
* Shelter Costs Vs. House Value - Line charts showcase the change of housing costs
* Neighbourhood Landscape - showing dwelling price and types per neighbourhood
* Top Expensive Neighbourhoods - presenting most expensive neighbourhoods in Toronto

You can navigate through the tabs in dashboard to explore more details about the evolution of Toronto real estate market by interacting with each chart. 

## Setup

You need to create an account at [mapbox](https://www.mapbox.com/) and [create an access token](https://docs.mapbox.com/help/how-mapbox-works/access-tokens/#creating-and-managing-access-tokens) in order to run maps visualizations using Plotly Express.

The project is configured through environment variables set in the .env file.

## Data Source

The data provided for this project was retrieved from the following websites:

* [Toronto Open Data](https://open.toronto.ca/)

* [Census Profile, 2016 Census - Toronto Metropolitan Area, Ontario and Canada](https://www12.statcan.gc.ca/census-recensement/2016/dp-pd/prof/details/page.cfm?Lang=E&Geo1=CMACA&Code1=535&Geo2=PR&Code2=01&SearchText=toronto&SearchType=Begins&SearchPR=01&B1=All&TABID=1&type=0)
