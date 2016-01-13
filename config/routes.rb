Rails.application.routes.draw do
  resources :meetings
  root 'welcome#index'
  get 'about' => 'welcome#about'

  resources :users
  resources :potential_appointments
  resources :carts
  resources :orders
  resources :comments
  resources :password_resets, only: [:new, :create, :edit, :update]

  patch 'users/:id' => 'users#verify', as: 'users_verify'
  get 'users/:id/email_confirm' => 'users#email_confirm', as: 'email_confirm_user'

  get 'FinNetwork' => 'advisors#index', as: 'advisors'
  get 'FinNetwork/results' => 'advisors#results'
  get 'FinNetwork/new' => 'advisors#new', as: 'advisor_new'
  post 'FinNetwork' => 'advisors#create'
  get 'FinNetwork/:id' => 'advisors#show', as: 'advisor'
  get 'FinNetwork/:id/edit' => 'advisors#edit', as: 'edit_advisor'
  patch 'FinNetwork/:id' => 'advisors#update'
  delete 'FinNetwork/:id' => 'advisors#destroy'

  get 'network_members' => 'admins#index'
  get 'admin/login' => 'admins#new'
  post 'admin_login' => 'admins#create'
  delete 'admin_logout' => 'admins#destroy'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
