require_relative '../test_helper'

class BookTest < ActiveSupport::TestCase
  test "should not save a book without a title" do
    book = Book.new(author: "Kennedy K")
    assert_not book.save, "Saved the book without a title"
  end
end
