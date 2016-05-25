FactoryGirl.define do
  factory :daily_performance do
    stock_ticker_id 1
    stock_price_avg(Random.rand(10_000)*0.01)
    yday 1
  end
end
