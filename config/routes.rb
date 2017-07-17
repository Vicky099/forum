Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	devise_scope :user do
    root to: 'devise/sessions#new'
    get 'sign-out', to: "devise/sessions#destroy"
  end

  resources :dashboards, only: [:index]
  resources :topics do
    member do
      resources :posts, only: [:new, :edit]
    end
  end
  resources :posts, only: [:index, :create]

end