class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def create

    book.save
    redirect_to: book_path(book)
  end

  def show

  end

  def edit
  end

  def destroy
  end
end
