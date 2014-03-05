CareerCenterApp::Application.routes.draw do
  resources :users

  resources :messages

  resources :conferences

  resources :tables

  # Suppoert for employer favoriting
  get  "employers/favorites" => "employers#index", :favorites => true
  get  "employers/:id/favorite" => "employers#favorite", :as => "favorite"
  get  "employers/:id/defavorite" => "employers#defavorite", :as => "defavorite"
  get  "employers/import_form" => "employers#import_form"
  post "employers/import_from_csv" => "employers#import_from_csv"
  get "employers/maps/:conferences" => "employers#maps"
  get "employers/set/:conferences" => "employers#set"
  get "employers/fest/:conferences" => "employers#fest"
  resources :employers

  # Google+ login support
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  resource :sessions, only: [:new, :create, :destroy] , :controller => 'sessions'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'employers#index'

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
