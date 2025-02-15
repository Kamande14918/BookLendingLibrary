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
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def borrow
    @book = Book.find(params[:id])
    if request.patch?
      @borrower = Borrower.find_or_create_by(name: params[:borrower][:name])
      @book.lendings.create(borrower: @borrower, borrowed_on: Date.today)
      redirect_to @book, notice: 'Book borrowed successfully.'
    else
      @borrower = Borrower.new
    end
  end

  def return
    @book = Book.find(params[:id])
    @lending = @book.lendings.find_by(returned_on: nil)
    if @lending
      @lending.update(returned_on: Date.today)
      redirect_to @book, notice: 'Book returned successfully.'
    else
      redirect_to @book, alert: 'This book is not currently borrowed.'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
end

