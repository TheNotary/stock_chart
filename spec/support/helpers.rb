def stub_time!(t = ActiveSupport::TimeZone[ENV['time_zone']].parse("2001-1-5 0:00"))
  allow(DateTime).to receive(:now) { t }
  @expected_period_beginning = t
end
