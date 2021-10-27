class RenameColumnTypeInPrescriptions < ActiveRecord::Migration[6.0]
  def change
    rename_column :prescriptions, :type, :prescription_type
  end
end
