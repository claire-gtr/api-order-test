class RemoveColumnsFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :line_sku
    remove_column :orders, :line_quantity
    remove_column :orders, :line_prescription_type
    remove_column :orders, :line_prescription_lens_color
    remove_column :orders, :line_prescription_left_sph
    remove_column :orders, :line_prescription_right_sph
  end
end
