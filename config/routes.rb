Rails.application.routes.draw do

  root 'home#index'

  resources :scholarships
  resources :scholarships_students
  resources :students 
  resources :providers

  post '/keepfollowing/:id', to: 'scholarships#follow', as: :follow
  post  '/removescholarship/:id', to: 'scholarships#remove', as: :remove
  get '/terminateuser', to: 'students#terminate', as: :terminate

  get "/provider", to: 'home#lender'

  post "/mailto", to: 'home#mailto'
  
  get '/contact', to: 'home#contact', as: 'contact'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/users/moredetails', to: 'students#more'
  post '/users/moredetails', to: 'students#more'


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
