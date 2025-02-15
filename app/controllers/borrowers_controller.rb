class BorrowersController < ApplicationController
  def show
    @borrower = Borrower.find(params[:id])
    @lendings =@borrower.lendings.includes(:book)
  end
end
