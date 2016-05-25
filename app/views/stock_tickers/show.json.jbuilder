json.extract! @stock_ticker, :id, :name, :stock_symbol

# looks like... {"2013-02-10 00:00:00 -0800": "12.50", ... }
json.graph_data do
  @stock_ticker.daily_performances.each do |p|
    price = p.stock_price_avg
    date = DateTime.now.beginning_of_year.advance(days: p.yday-1)
    json.set! date, price
  end
end
