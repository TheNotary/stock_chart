class DailyPerformancesController < ApplicationController
  before_action :set_daily_performance, only: [:show, :edit, :update, :destroy]

  # GET /daily_performances
  # GET /daily_performances.json
  def index
    @daily_performances = DailyPerformance.all
  end

  # GET /daily_performances/1
  # GET /daily_performances/1.json
  def show
  end

  # GET /daily_performances/new
  def new
    @daily_performance = DailyPerformance.new
  end

  # GET /daily_performances/1/edit
  def edit
  end

  # POST /daily_performances
  # POST /daily_performances.json
  def create
    @daily_performance = DailyPerformance.new(daily_performance_params)

    respond_to do |format|
      if @daily_performance.save
        format.html { redirect_to @daily_performance, notice: 'Daily performance was successfully created.' }
        format.json { render :show, status: :created, location: @daily_performance }
      else
        format.html { render :new }
        format.json { render json: @daily_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_performances/1
  # PATCH/PUT /daily_performances/1.json
  def update
    respond_to do |format|
      if @daily_performance.update(daily_performance_params)
        format.html { redirect_to @daily_performance, notice: 'Daily performance was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_performance }
      else
        format.html { render :edit }
        format.json { render json: @daily_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_performances/1
  # DELETE /daily_performances/1.json
  def destroy
    @daily_performance.destroy
    respond_to do |format|
      format.html { redirect_to daily_performances_url, notice: 'Daily performance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_performance
      @daily_performance = DailyPerformance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_performance_params
      params.require(:daily_performance).permit(:stock_ticker_id, :stock_price_avg, :yday)
    end
end
