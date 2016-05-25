FactoryGirl.define do
  factory :stock_ticker do
    letters = %w(z a b c d)
    sequence(:name) {|n| "Stock aa#{letters[n]}" }
    sequence(:stock_symbol) {|n| "aa#{letters[n]}" }
  end

  factory :stock_ticker_with_30_days, parent: :stock_ticker do

    after(:create) do |stock_ticker|
      now = DateTime.now

      30.times do |i|
        date_for_iteration = now.advance(days: (i*-1))
        yday = date_for_iteration.yday
        year = date_for_iteration.year

        stock_ticker.daily_performances << FactoryGirl.create(:daily_performance,
          stock_price_avg: Random.rand(10_000)*0.01,
          yday: yday,
          year: year)
      end

    end

  end

end
