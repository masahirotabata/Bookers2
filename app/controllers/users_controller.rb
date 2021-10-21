class UsersController < ApplicationController
  def show
  @user_info = User.find(params[:id])
  @book =  Book.new
  user = User.find(params[:id])
  @books = user.books
  end
  
  
  

  def edit
  user = User.find(params[:id])
  @book = user.books.find(params[:id])
  @book = params_books
  end
end
