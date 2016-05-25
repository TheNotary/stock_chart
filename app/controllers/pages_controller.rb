class PagesController < ApplicationController
  def home
    @stock_tickers = StockTicker.all
  end
end
