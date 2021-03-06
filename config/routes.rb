Diary::Application.routes.draw do

  resources :user_informations do
    member do
      get 'render_user_information'
    end
  end

  resources :comments do

    collection do
      
      get 'render_comment'

    end

  end

  resources :attachment_images

  #  devise_for :users
  devise_for :users, :controllers => {:registrations => "devise_customed/registrations",:sessions => "devise_customed/sessions"}
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  get "home/index"

#  match  '/logout' => "devise/sessions#destroy" #定制退出页
  #  定制登录等界面
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "register", :to => "devise/registrations#new"
    get "logout", :to => "devise/sessions#destroy"
    get "profile", :to => "devise/registrations#edit"
  end

  root :to => 'home#index' #定制首页

  resources :blogs do
    collection do

      get 'render_comment'
  end
end

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
