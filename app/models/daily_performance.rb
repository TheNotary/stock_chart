class DailyPerformance < ActiveRecord::Base
  belongs_to :stock_ticker

  def self.last_30_days
    now = DateTime.now

    # we need to conduct a bit of logic to query records from the end of the
    # prior year and the beginning of the first year in the corner case that
    # we're querying on one of the first 30 days of the year
    if (now.yday - 29) < 1
      start_date_last_year = now.advance(days: -29)
      end_date_last_year = start_date_last_year.end_of_year

      sql = <<-EOT.strip_heredoc
        year = :year_a AND yday >= :start_date_a AND yday <= :end_date_a
        OR year = :year_b AND yday >= :start_date_b AND yday <= :end_date_b
      EOT

      where(sql,
        { start_date_a: now.beginning_of_year.yday,
          end_date_a: now.yday,
          year_a: now.year,

          start_date_b: start_date_last_year.yday,
          end_date_b: end_date_last_year.yday,
          year_b: now.year-1 })
        .order(:yday)

    else
      where("year = :year AND yday >= :start_date AND yday <= :end_date",
        { start_date: now.yday-29, end_date: now.yday, year: now.year })
        .order(:yday)
    end
  end
end
