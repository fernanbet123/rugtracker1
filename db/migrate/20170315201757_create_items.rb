class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :tag, array: true, default: []
      t.string :status
      t.integer :quantity
        add_column :items, :quantity, :integer
      t.references :user, foreign_key: true

      t.timestamps
    end

  end
end
