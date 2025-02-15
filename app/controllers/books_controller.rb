class BooksController < ApplicationController
  def index
    @books = Book.all 
  end

  def show
    @book = Book.find(params[:id])
    @lendings = @book.lendings.includes(:borrower)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else 
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
    end

    def borrowed_on
      @book = Book.find(params[:id])
    end

    def return
      @book = Book.find(params[:id])
    end

    private

    def book_params
      params.require(:book).permit(:title, :author, :description)
    end
  end
  
