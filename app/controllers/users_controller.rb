
class UsersController < ApplicationController



  def show
  @user = User.find(params[:id])
  @book =  Book.new
  @books = @user.books


  end

  def index
  @book = Book.new
  @users = User.all.order(created_at: :desc)
  @user = current_user

  end

  def update
  @user = User.find(params[:id])
   if  @user.update(users_params)
      flash[:notice] = "successfully"
       redirect_to user_path(current_user.id)

   else
     
     @user_info = current_user
    profile_image = nil
     
  render:edit
   end
  end


  def edit
  
   @user = User.find(params[:id])

  if @user != current_user

  redirect_to user_path(current_user.id)

  end

  end

 private
  def users_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end


