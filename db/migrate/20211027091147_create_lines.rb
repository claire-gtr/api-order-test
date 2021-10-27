class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.references :order, null: false, foreign_key: true
      t.string :sku
      t.string :quantity

      t.timestamps
    end
  end
end
