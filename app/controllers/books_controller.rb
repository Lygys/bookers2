class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def create
    @nbook = Book.new(book_params)
    @nbook.user_id = current_user.id
    if @nbook.save
      redirect_to book_path(@nbook), notice: "Book was successfully created."
    else
      @books = Book.all
      render 'books/index'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to root_path unless @book.user_id == current_user.id
  end

  def update
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      if @book.update(book_params)
       redirect_to book_path(@book), notice: "Book was successfully updated."
      else
        render 'books/edit'
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      @book.destroy
      redirect_to books_path, notice: "Book was successfully deleted."
    else
      redirect_to root_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
