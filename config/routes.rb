Rails.application.routes.draw do
  resources :daily_performances
  resources :stock_tickers
  root to: 'pages#home'
  get 'pages/home'
end
