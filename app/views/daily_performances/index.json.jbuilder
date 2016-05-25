json.array!(@daily_performances) do |daily_performance|
  json.extract! daily_performance, :id, :stock_ticker_id, :stock_price_avg, :yday
  json.url daily_performance_url(daily_performance, format: :json)
end
