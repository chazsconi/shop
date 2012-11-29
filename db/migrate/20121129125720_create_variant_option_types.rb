class CreateVariantOptionTypes < ActiveRecord::Migration
  def change
    create_table :variant_option_types do |t|
      t.string :name
      t.string :description
      t.string :display_name

      t.timestamps
    end
  end
end
