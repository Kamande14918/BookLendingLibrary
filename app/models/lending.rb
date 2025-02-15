class Lending < ApplicationRecord
  belongs_to :book
  belongs_to :borrower

  validates :borrowed_on, presence: true
end
