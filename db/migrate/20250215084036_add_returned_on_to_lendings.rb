class AddReturnedOnToLendings < ActiveRecord::Migration[6.0]
  def change
    add_column :lendings, :returned_on, :date
  end
end
