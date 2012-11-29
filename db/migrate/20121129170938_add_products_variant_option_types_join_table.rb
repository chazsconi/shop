class AddProductsVariantOptionTypesJoinTable < ActiveRecord::Migration

 def self.up
    create_table :products_variant_option_types, :id => false do |t|
      t.integer :product_id
      t.integer :variant_option_type_id
    end
  end

  def self.down
    drop_table :products_variant_option_types
  end
  
end
