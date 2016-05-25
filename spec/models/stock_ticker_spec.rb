require 'rails_helper'

RSpec.describe StockTicker, type: :model do

  before :each do
    @stock_ticker = FactoryGirl.create(:stock_ticker_with_30_days)
  end

  it "should by able to get the latest 30 days data" do
    expect(@stock_ticker.daily_performances.count).to eq 30
  end

  # FIXME:  See #5 in gh...
  describe "get_last_30_days" do
    it "should get 29 days if there was no record today and there was won 31 days ago" do
      yday = DateTime.now.yday
      @stock_ticker.daily_performances.where(yday: yday).first.update_attributes(yday: yday-30)
      c = @stock_ticker.select_last_30_days_daily_performances.count

      expect(c).to eq(29)
      # check to make sure when I create an extra day I don't get 31 days
    end

    it "should NOT list more than 30 days if a new day is created in the distant future" do
      yday = DateTime.now.yday
      @stock_ticker.daily_performances.create(yday: yday+10, stock_price_avg: 30.03)
      c = @stock_ticker.select_last_30_days_daily_performances.count

      expect(c).to eq(30)
      # check to make sure when I create an extra day I don't get 31 days
    end

    it "should be able to query last year's stock records too given an early yday as now" do
      stub_time!(five_days_into_a_year)
      @stock_ticker2 = FactoryGirl.create(:stock_ticker_with_30_days)

      c = @stock_ticker2.select_last_30_days_daily_performances.count
      expect(c).to eq(30)

      # just to make sure nothing weird happens, advance a day and expect 1 less count
      stub_time!(five_days_into_a_year.advance(days: 1))
      c = @stock_ticker2.select_last_30_days_daily_performances.count
      expect(c).to eq(29)
    end

  end

end


def five_days_into_a_year
  ActiveSupport::TimeZone['Pacific Time (US & Canada)'].parse("2001-1-5 0:00")
end
