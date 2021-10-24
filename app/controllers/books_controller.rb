class BooksController < ApplicationController
    def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
    end

  def index
   @user_info = User.find(current_user.id)
  @book =  Book.new
  @user = User.find(current_user.id)
  @books = @user.books
 #@users = User.all.order
 #@books = @users.books
  end

  def show
  @book = Book.new
  @user = User.find(current_user.id)
  @book_show = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
   #@book =  user.books.all.find(book.id)
  end

  def create
   @user_info = User.find(current_user.id)
   @book = Book.new(books_params)
   @book.user_id = current_user.id
   user = User.find(current_user.id)
   @books = user.books
   if @book.save
      redirect_to user_session_path(id: current_user)
   else

      render 'books/index'
   end
  end

  def update
    @book = Book.find(params[:id])
   if  @book.update(books_params)
       redirect_to user_path(current_user.id)
   else
     render :edit
   end
  end

  def destroy
    # Book.find(params[:id]).destroy
    # redirect_to user_path(current_user.id)
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def books_params
    params.require(:book).permit(:title, :body)
  end

end
