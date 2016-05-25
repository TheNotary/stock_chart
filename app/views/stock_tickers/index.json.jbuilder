json.array!(@stock_tickers) do |stock_ticker|
  json.extract! stock_ticker, :id, :name, :stock_symbol
  json.url stock_ticker_url(stock_ticker, format: :json)
end
