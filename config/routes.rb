Rails.application.routes.draw do

 devise_for :users
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'homes#top'
get 'home/about' => 'homes#about'
#get '/books/book.id/edit' => 'books#edit'
#post '/books/:id/update' => 'books#update'
 resources :books
 resources :users
 resources :post_images, only: [:new, :create, :index, :show, :destroy]

end
