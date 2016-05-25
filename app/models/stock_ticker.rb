class StockTicker < ActiveRecord::Base
  has_many :daily_performances


  def select_last_30_days_daily_performances
    daily_performances.last_30_days
  end


end
