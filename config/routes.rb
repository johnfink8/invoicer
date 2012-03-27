Invoicer::Application.routes.draw do

  root :to =>  "home#index"

  devise_for :users

  resources :invoices

  resources :contacts
  
  resources :line_items
  
  resources :users, :only => :show

  resources :line_descriptions
end
