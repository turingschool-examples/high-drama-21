Rails.application.routes.draw do
  resources :hospital do
    resources :doctor, only: [:show, :destroy]
  end
end
