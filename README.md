# Stock Chart

##### Features
- Presents a drop down menu for choosing between 'all' available stock tickers
- Uses an ajax pattern so the page doesn't need to reload
- Displays a line chart of stock prices over the last 30 days for a selected stock
- 'all' available stock tickers will be limited to aaa, aab, aac, and aad

## Details

The stock chart rails app will have a drop down that will show all available stock tickers.

When a stock is chosen from the dropdown, the stock chart rails app will show a line chart of the stock prices for each day for a given stock over a period of 30 days in a chart.

Create 4 different stocks and 30 days of data for each stock. If you wish, some days can have missing data.

Note: when a stock is selected from the drop down, the page should not reload. This is a necessary requirement.

## Loading test data

Since it's not hooked into any stock ticket services, you'll want to load up some test data by the below command:

```
4.times { FactoryGirl.create(:stock_ticker_with_30_days) }
```
