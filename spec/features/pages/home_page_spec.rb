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

  scenario 'visitor sees a selectbox with all stocks and populates data', js: true do
    @stock_tickers = 4.times.map { FactoryGirl.create(:stock_ticker_with_30_days) }

    visit root_path

    # test for select box presence
    select_dropdown = find('#Stock_Tickers')
    expect(select_dropdown).to be_truthy

    # Use select box to pull in chart data
    the_fifth_element = select_dropdown.find(:xpath, 'option[5]')

    # since our first option is an instruction to use the dropdown menu,
    # and we have 4 StockTickers, we should see a fifth option to select
    expect(@stock_tickers.last.name).to eq(the_fifth_element.text)

    the_fifth_element.select_option

    # test for collection of json data
    data_count = page.evaluate_script("chart1.data[0].data.length")
    first_data_pair =  page.evaluate_script("chart1.data[0].data[0]")
    last_data_pair =  page.evaluate_script("chart1.data[0].data[29]")
    expect(data_count).to eq 30

    # confirm values in chart match values in database
    expect(first_data_pair.last.to_s).to eq(@stock_tickers.last.select_last_30_days_daily_performances.first.stock_price_avg.to_s)
    expect(last_data_pair.last.to_s).to eq(@stock_tickers.last.select_last_30_days_daily_performances.last.stock_price_avg.to_s)
  end

end
