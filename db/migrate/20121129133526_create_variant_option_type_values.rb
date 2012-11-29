class CreateVariantOptionTypeValues < ActiveRecord::Migration
  def change
    create_table :variant_option_type_values do |t|
      t.string :name
      t.string :description
      t.references :variant_option_type

      t.timestamps
    end
    add_index :variant_option_type_values, :variant_option_type_id
  end
end
