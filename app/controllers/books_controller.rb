class BooksController < ApplicationController
  def top
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	if book.save
  		flash[:notice] = "Successfully"
  		redirect_to book_path(book.id)
  	end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@books = Book.all.order("id DESC")
  	@book = Book.new
  end

  def edit
  	@book = Book.find(params[:id])
  end
  def update
  	book = Book.new(book_params)
  	if book.update(book_params)
  		flash[:notice] = "Successfully"
  		redirect_to book_path(book.id)
  	end
  end
  def destroy
  	book = Book.find(params[:id])
  	if book.destroy
  		flash[:notice]= "Book was successfully delated"
  		redirect_to books_path
  	end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
