class LendingsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @lending = @book.lendings.new
  end

  def create
    @book = Book.find(params[:book_id])
    @borrower = Borrower.find_or_create_by(name: params[:lending][:borrower_name])

    if @borrower.persisted?
      @lending = @book.lendings.new(borrower: @borrower, borrowed_on: Date.today)
      if @lending.save
        redirect_to @book, notice: 'Book borrowed successfully.'
      else
        @lending = @book.lendings.new
        render :new, status: :unprocessable_entity
      end
    else
      @lending = @book.lendings.new
      render :new, alert: 'Unable to create or find borrower.', status: :unprocessable_entity
    end
  end

  def borrow
    @book = Book.find(params[:book_id])
    @borrower = Borrower.find_or_create_by(name: params[:borrower_name])

    if @borrower.persisted?
      @lending = @book.lendings.new(borrower: @borrower, borrowed_on: Date.today)
      if @lending.save
        redirect_to @book, notice: 'Book borrowed successfully.'
      else
        redirect_to @book, alert: 'Unable to borrow book.'
      end
    else
      redirect_to @book, alert: 'Unable to create or find borrower.'
    end
  end

  def return
    @book = Book.find(params[:book_id])
    @lending = @book.lendings.find(params[:id])
    if @lending.update(returned_on: Date.today)
      redirect_to @book, notice: 'Book returned successfully.'
    else
      redirect_to @book, alert: 'Unable to return book.'
    end
  end

  private

  def lending_params
    params.require(:lending).permit(:borrower_name)
  end
end
