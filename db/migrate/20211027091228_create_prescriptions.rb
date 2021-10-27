class CreatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions do |t|
      t.references :line, null: false, foreign_key: true
      t.string :type
      t.string :lens_color
      t.string :left_sph
      t.string :right_sph

      t.timestamps
    end
  end
end
