class BooksController < ApplicationController
    def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
    end

  def index
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
   book = Book.new(books_params)
   book.user_id = current_user.id
   book.save!
   redirect_to user_session_path(id: current_user)

  end

  def update
    book = Book.find(params[:id])
    book.update(books_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to user_path(current_user.id)
  end

  private
  def books_params
    params.require(:book).permit(:title, :body)
  end

end
