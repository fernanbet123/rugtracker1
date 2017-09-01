class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :tag[], array: true
      t.string :status
      t.integer :quantity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
