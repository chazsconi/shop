class AddProductsTagsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :products_tags, :id => false do |t|
      t.integer :product_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :products_tags
  end
end
