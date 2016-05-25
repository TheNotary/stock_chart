class StockTickersController < ApplicationController
  before_action :set_stock_ticker, only: [:show, :edit, :update, :destroy]

  # GET /stock_tickers
  # GET /stock_tickers.json
  def index
    @stock_tickers = StockTicker.all
  end

  # GET /stock_tickers/1
  # GET /stock_tickers/1.json
  def show
  end

  def graph_data
    @stock_ticker = StockTicker.find(params[:stock_ticker_id])
  end

  # GET /stock_tickers/new
  def new
    @stock_ticker = StockTicker.new
  end

  # GET /stock_tickers/1/edit
  def edit
  end

  # POST /stock_tickers
  # POST /stock_tickers.json
  def create
    @stock_ticker = StockTicker.new(stock_ticker_params)

    respond_to do |format|
      if @stock_ticker.save
        format.html { redirect_to @stock_ticker, notice: 'Stock ticker was successfully created.' }
        format.json { render :show, status: :created, location: @stock_ticker }
      else
        format.html { render :new }
        format.json { render json: @stock_ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_tickers/1
  # PATCH/PUT /stock_tickers/1.json
  def update
    respond_to do |format|
      if @stock_ticker.update(stock_ticker_params)
        format.html { redirect_to @stock_ticker, notice: 'Stock ticker was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_ticker }
      else
        format.html { render :edit }
        format.json { render json: @stock_ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_tickers/1
  # DELETE /stock_tickers/1.json
  def destroy
    @stock_ticker.destroy
    respond_to do |format|
      format.html { redirect_to stock_tickers_url, notice: 'Stock ticker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_ticker
      @stock_ticker = StockTicker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_ticker_params
      params.require(:stock_ticker).permit(:name, :stock_symbol)
    end
end
