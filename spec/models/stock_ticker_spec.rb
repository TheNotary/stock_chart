require 'rails_helper'

RSpec.describe StockTicker, type: :model do

  before :each do
    @stock_ticker = FactoryGirl.create(:stock_ticker_with_30_days)
  end

  it "should by able to get the latest 30 days data" do
    expect(@stock_ticker.daily_performances.count).to eq 30
  end


end
