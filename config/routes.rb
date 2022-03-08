Rails.application.routes.draw do
  resources :hospital do
    resources :doctor, only: [:show]
  end
end
