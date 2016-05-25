class AddYearToDailyPerformance < ActiveRecord::Migration
  def change
    add_column :daily_performances, :year, :integer
  end
end
