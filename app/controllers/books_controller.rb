class BooksController < ApplicationController
    def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
    end



  def index
   @user_info = User.find(current_user.id)
  @book =  Book.new
  @user = current_user
  @books = Book.all

  end

  def show
  @book = Book.new
  @book_show = Book.find(params[:id])
  @user = @book_show.user
  #@user = @book_show.users
  end

  def edit
    @book = Book.find(params[:id])
   #@book =  user.books.all.find(book.id)

    #@book = Book.find(params[:id])
    #@user = @book.user

   if @book.user == current_user

     render:edit

   else

    redirect_to books_path

   end

  end
   #if  @user.id == current_user.id

   #@book =  user.books.all.find(book.id)
   #else

  #@user_info = User.find(current_user.id)
  #@book =  Book.new
  #@user = current_user
  #@books = Book.all

  #redirect_to books_path
  #end


  def create
   #@user_info = User.find(current_user.id)
   @book = Book.new(books_params)
   @book.user_id = current_user.id
   user = User.find(current_user.id)
   @books = user.books
   if @book.save
     flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
   else
  @books = Book.all
  @user = current_user
      render :index
   end
  end

  def update
    @book = Book.find(params[:id])
   if  @book.update(books_params)
     flash[:notice] = "successfully"
       redirect_to book_path(@book.id)
   else
     flash[:notice] = "error"
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
