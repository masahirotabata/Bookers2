
class UsersController < ApplicationController


  def show
  @user_info = User.find(params[:id])
  @book =  Book.new
  user = User.find(params[:id])
  @books = user.books.where(user_id: current_user.id).order(created_at: :desc).limit(1)
  end

  def index
  @book = Book.new
  @users = User.all
  @user_info = User.find(current_user.id)

  end
  
  def update
  @user = User.find(params[:id])
   if  @user.update(users_params)
       redirect_to user_path(current_user.id), notice: "Editing was successful"
   else
     render :edit
   end
  end

 


  def edit
  @user_info = User.find(params[:id])
  
  end

 private
  def users_params
    params.require(:user).permit(:name, :profile_image,:info)
  end
end
