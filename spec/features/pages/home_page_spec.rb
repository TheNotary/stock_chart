# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home page' do

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see "Stock Chart"
  scenario 'visit the home page' do
    visit root_path
    expect(page).to have_content 'Stock Chart'
  end

  scenario 'visitor sees a selectbox with all stocks and populates data' do
    @stock_tickers = 4.times { FactoryGirl.create(:stock_ticker_with_30_days) }

    visit root_path

    # test for select box presence
    select_box = page.find(:select, 'Stock_Tickers')
    expect(select_box).to be_truthy

    pending "need more information on charting library before test can be written"
    raise "pending"

    # Use select box to pull in chart data

    # test for collection of json data

    # see if you can interact with the chart library and verify it's got
    # the data possibly
  end

end
