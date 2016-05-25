class CreateDailyPerformances < ActiveRecord::Migration
  def change
    create_table :daily_performances do |t|
      t.integer :stock_ticker_id

      # decimal type chosen per http://stackoverflow.com/questions/1019939/what-is-the-best-method-of-handling-currency-money
      # potentially worth reconsidering
      t.decimal :stock_price_avg, :precision => 8, :scale => 2
      t.integer :yday

      t.timestamps null: false
    end
  end
end
