class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :VAT_exempt, :category
  validates :name,  :presence => true
  validates :price,  :presence => true
  belongs_to :category
  has_and_belongs_to_many :tags
  has_many :variants
end
