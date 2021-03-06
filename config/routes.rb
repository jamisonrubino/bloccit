Rails.application.routes.draw do
  # get 'sponsored_posts/show'
  # get 'sponsored_posts/new'
  # get 'sponsored_posts/edit'
  # get 'questions/index'
  # get 'questions/new'
  # get 'questions/edit'
  # get 'questions/show'
  # get 'advertisements_controller/index'
  # get 'advertisements_controller/show'
  # get 'advertisements_controller/new'
  # get 'advertisements_controller/create'
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/edit'
  # get 'welcome/index'
  # get 'welcome/about'
  # get 'welcome/faq'
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  
  resources :users, only: [:new, :create, :show]
  post 'users/confirm' => 'users#confirm'
  
  resources :users, only: [] do
    resources :comments, only: [:destroy]
  end
  
  resources :questions
  resources :advertisements
  resources :posts
  get 'about' => 'welcome#about'
  root 'welcome#index'

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
