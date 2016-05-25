Rails.application.routes.draw do
  resources :daily_performances
  resources :stock_tickers do
    get '/graph_data', to: 'stock_tickers#graph_data'
  end
  root to: 'pages#home'
  get 'pages/home'
end
