Rails.application.routes.draw do
 
  get 'events/new'
  get 'events/index'
  get 'events/show'
  get 'events/edit'
  resources :admins
  resources :complaints
  # devise_for :users
  resources :events
  resources :maintainances
  resources :messages
  resources :statuses
  resources :charges
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  devise_for :users, controllers: {registrations: 'users/registrations',passwords: 'users/passwords'} do
  	get "/change_password", :to => "users/passwords#edit", :as => :change_password
  	# get '/:id/edit_role',to: "users/registrations#edit_role",as: :edit_role
  	#get "/:id/edit_role", :to=> "users/registrations#edit_role", :as=> :edit_role
  end  
  resources :societies 
  root to: 'societies#add' 
   resources :users do 
      member do
        post :edit_role
        patch :change_password
      end
   end
   resources :users,:path=>"member" do
    collection do
      get :change_password_edit
      patch :change_password_update
    end
  end 
   resources :statuses do
      member do
        post :edit_status
      end
   end
    resources :complaints do
      member do
        post :edit_status
      end
   end
  resources :users do
      member do
        get :send_mail
      end
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
