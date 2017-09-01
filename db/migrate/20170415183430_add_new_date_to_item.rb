class AddNewDateToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :newDate, :date
  end
end
