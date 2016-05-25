FactoryGirl.define do
  factory :stock_ticker do
    letters = %w(z a b c d)
    sequence(:name) {|n| "Stock aa#{letters[n]}" }
    sequence(:stock_symbol) {|n| "aa#{letters[n]}" }
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
