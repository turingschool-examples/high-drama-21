Rails.application.routes.draw do

  resources :doctors, only: [:show]
  resources :hospitals, only: [:show]
  delete '/doctors/:doctor_id/patients/:patient_id', to: 'doctor_patients#destroy'

end
