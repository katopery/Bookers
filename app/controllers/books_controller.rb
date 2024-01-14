class BooksController < ApplicationController
  def new
    @book_new = Book.new
  end

  def create
    @book_create = Book.new(book_params)

    if @book_create.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book_create.id)
    else
      render :index
    end

  end

  def index
    @book_index = Book.new
    @books_index = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
