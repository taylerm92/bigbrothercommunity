Rails.application.routes.draw do
  resources :events
  devise_for :users, :controllers => { registration: 'registration' }
  get 'login/index'

  resources :users
  resources :comments
  resources :posts
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :restore
    end
  end
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :mark_as_read
    end
  end
  resources :messages, only: [:new, :create]
  resources :posts do
    resources :comments
  end
  
  
  root 'newsfeed#index'
  
  get 'comments/index'
  get 'newsfeed/index'
  get 'users/index'
  get 'newsfeed/businesses'
  get 'newsfeed/agency'
  
  #root 'login#index', as: 'login'
  #root 'newsfeed#index', as: 'newsfeed'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
