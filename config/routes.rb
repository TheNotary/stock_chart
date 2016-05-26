Rails.application.routes.draw do

  resources :daily_performances
  resources :stock_tickers do
    get '/graph_data', to: 'stock_tickers#graph_data'
    post '/generate_new_daily_performance_record', to: 'stock_tickers#generate_new_daily_performance_record'
  end

  root to: 'pages#home'
  get 'pages/home'
end
