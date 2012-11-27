class Category < ActiveRecord::Base
  attr_accessible :name
  validates :name,  :presence => true, :length => { :minimum => 5 }
  has_many :products
end
