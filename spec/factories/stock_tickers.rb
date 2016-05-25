FactoryGirl.define do
  factory :stock_ticker do
    name "Stock Name"
    sequence(:stock_symbol) {|n| "aa#{n}" }
  end

  factory :stock_ticker_with_30_days, parent: :stock_ticker do

    after(:create) do |stock_ticker|
      yday_now = DateTime.now.yday
      30.times do |i|
        stock_ticker.daily_performances << FactoryGirl.create(:daily_performance, yday: yday_now-i)
      end
    end
    
  end

end
