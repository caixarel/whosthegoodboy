Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get ':id/offers_made', to: 'profiles#offers_made'
  get ':id/offers_received', to: 'profiles#offers_received'
  get ':id/profiles', to: 'profiles#index'
  resources :pets do
    resources :offers , except: [:show]
    get 'offers/:id/accept', to: 'offers#accept' ,:as => "accepted"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
