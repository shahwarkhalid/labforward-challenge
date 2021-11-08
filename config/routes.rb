Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'v1/users/sessions',
    registrations: 'v1/users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resources :analytics, only: [] do
      collection do
        post :identify_peaks
      end
    end
  end

  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
end
