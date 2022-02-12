Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get ':id/offers_made', to: 'profiles#offers_made'
  get ':id/offers_received', to: 'profiles#offers_received'
  get ':id/profiles', to: 'profiles#profile', :as => 'profile'
  get ':id/my_pets', to: 'profiles#my_pets', :as => 'my_pets'

  resources :pets do
    resources :offers, except: [:show]
    get 'offers/:id/accept', to: 'offers#accept', :as => "accepted"
    get 'offers/:id/reject', to: 'offers#reject', :as => "rejected"

    resources :reviews
  end
end
