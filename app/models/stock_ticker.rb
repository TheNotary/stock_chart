class StockTicker < ActiveRecord::Base
  has_many :daily_performances
end
