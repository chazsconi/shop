class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :VAT_exempt, :tag_ids, :variant_option_type_ids
  validates :name,  :presence => true
  validates :price,  :presence => true
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :variant_option_types
  has_many :variants
  
end
