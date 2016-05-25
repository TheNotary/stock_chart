class DailyPerformance < ActiveRecord::Base
  belongs_to :stock_ticker

  def self.last_30_days
    where("yday >= :start_date AND yday <= :end_date",
      {start_date: DateTime.now.yday-29, end_date: DateTime.now.yday})
      .order(:yday)
  end
end
