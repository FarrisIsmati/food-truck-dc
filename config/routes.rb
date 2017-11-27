Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  root to: redirect('/companies')

  resources :companies do
    resources :trucks
    resources :comments
    member do
      post :create_comment
    end
  end
end
