class BooksController < ApplicationController
  def top
  # redirect_to books_path
  end

  def show
   @book = Book.find(params[:id])
  end

  def index
   @books = Book.all
   @book = Book.new
  end

  def new
   @book = Book.new
  end

  def edit
   @book = Book.find(params[:id])
  end

  def create
  	book = Book.new(book_params)
  	if book.save
  	redirect_to book_path(book.id), notice: 'Book was successfully created.'
  else
    render :new
  end
  end
  
  def update
   book = Book.find(params[:id])
   if book.update(book_params)
   redirect_to book_path(book.id), notice: 'Book was successfully created.'
  else
    render :edit
  end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path(book.id)
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
