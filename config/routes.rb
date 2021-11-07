Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :analytics, only: [] do
    collection do
      post :identify_peaks
    end
  end
end
