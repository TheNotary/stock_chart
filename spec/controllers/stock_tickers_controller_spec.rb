require 'rails_helper'

RSpec.describe StockTickersController, type: :controller do

  before :each do
    @stock_ticker = FactoryGirl.create(:stock_ticker_with_30_days)
  end

  describe "GET #graph_data" do
    it "returns http success" do
      get :graph_data, { :format => 'json', stock_ticker_id: @stock_ticker.id }
      expect(response).to have_http_status(:success)
    end
  end

end
