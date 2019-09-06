Rails.application.routes.draw do
  scope :admin do
    devise_for :admins, controllers: { sessions: 'admin/admins/sessions' }
  end

  namespace :admin do
    root to: 'main#index'

    resources :teachers, except: :show
    resources :disciplines, except: :show

    resources :courses, except: :show do
      resources :lessons, except: :show
    end

    namespace :api do
      namespace :lessons do
        resource :mass_update, only: :create
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
