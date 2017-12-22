Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # Good job overriding devise standard sign up

  root to: redirect('/companies')

  resources :companies do
    resources :trucks
    resources :comments
    member do
      post :create_comment
      # ^ Why not just just the standard post route created by `resources :comments` ?
      post :create_truck
    end
  end
end
