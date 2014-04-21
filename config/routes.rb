CareerCenterApp::Application.routes.draw do
  resources :users

  resources :messages

  get "conferences/select_con" => "conferences#select_con"
  get "conferences/set_session" => "conferences#set_session"
  resources :conferences

  resources :tables

  #support for picking a fair
  # Either I pass the conference as part of the url and let all urls that start with employers/conf/(anything else)
  # be picked up by this controler. Which i then use the url in the employers controller to pass the correct employers 
  # to be rendered. Or, I need a better way of passing the uers fair choice to the controller. 
  get'employers/conf/' => "employers#index"
  # Suppoert for employer favoriting
  get  "employers/favorites" => "employers#index", :favorites => true
  get  "employers/:id/favorite" => "employers#favorite", :as => "favorite"
  get  "employers/:id/defavorite" => "employers#defavorite", :as => "defavorite"
  get  "employers/import_form" => "employers#import_form"
  post "employers/import_from_csv" => "employers#import_from_csv"
  get  "employers/maps/:conferences" => "employers#maps"
  get  "employers/landing" => "employers#landing", :as => "landing"
  get  "employers/about_us" => "employers#about_us", :as => "about_us"

  get  "employers/map" => "employers#map"
  post "employers/map_upload" => "employers#map_upload"

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
   #
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
