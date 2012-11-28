class Variant < ActiveRecord::Base
  attr_accessible :code
  belongs_to :product
end
