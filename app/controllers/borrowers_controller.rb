class BorrowersController < ApplicationController
  def show
    @borrower = Borrower.find(params[:id])
    @lendings = @borrower.lendings.includes(:book)
  end

  def index
    @borrowers = Borrower.all
  end
end
