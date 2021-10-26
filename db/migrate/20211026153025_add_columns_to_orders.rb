class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :acetate_id, :string
    add_column :orders, :shipping_country, :string
    add_column :orders, :line_sku, :string
    add_column :orders, :line_quantity, :string
    add_column :orders, :line_prescription_type, :string
    add_column :orders, :line_prescription_lens_color, :string
    add_column :orders, :line_prescription_left_sph, :string
    add_column :orders, :line_prescription_right_sph, :string
  end
end
