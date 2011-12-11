Cognito1::Application.routes.draw do

  resources :timezones

  match "/tagsearch_results/" => "events#tagsearch_results", :via => :get, :as =>"tagsearch_results"
  match "popular/events", :to => "events#popularevents"
  match "popular/tags", :to => "events#popular_tags"
  
  get "events/tagsearch" => "events#tagsearch", :as => :tagsearch

  get "events/tags" => "events#tags", :as => :tags

  match "events/hosting", :to => 'events#hosting'
  match "events/watching", :to => 'events#watching'
  match "events/attending", :to => 'events#attending'
  resources :events

  
  resources :attendees
  
  match "attendees/add_vote", :to => 'attendees#add_vote'
  match "attendees/remove_vote", :to => 'attendees#remove_vote'
  
  resources :watchers
  
  resources :resources
  #resources :event_resources
  
  resources :events do
    member do
      get :resources
    end  
  end
  
  
  #resources :tags
  #resources :sessiontags
  
  #resources :events
  #resources :attendees

  
  get "relationships/create"

  get "relationships/destroy"

  resources :users do
    member do
      get :following, :followers
    end  
  end
  
  
  resources :sessions,   :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  

  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/help', :to => 'pages#help'
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/popular', :to => 'pages#popular'
  
  
  root :to => 'pages#home'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
