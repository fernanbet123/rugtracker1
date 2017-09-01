class AddTagNumToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :tagNum, :text, array: true, default: []
    serialize :tagNum
  end
end
