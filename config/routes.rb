Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'courses#index'
  root 'home#index'
  #get 'game' => 'home#game'
  #get 'gmap' => 'home#gmap'
  #get 'gameroll' => 'home#gameroll'
  resources :topics do
  get ':slidebox/:subtopic_id' => :slidebox, on: :collection
  end
  
  resources :users
    resources :courses do
    resources :topics	
  end
  resources :subtopics do
	resources :examples
    resources :proofs  
  end
=begin  resources :products do
  member do
  get 'addtocart' => 'products#addtocart', as: :addtocart
  get 'removeproduct'
  
  end
  collection do
  get 'cart' 
  get ':id/:qty/productchange' => 'products#changeproducts', as: :changeproducts
  end
  end
=end
  
  if Rails.env.production?
   get '404', :to => 'application#page_not_found'
  end  

  

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
