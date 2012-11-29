class VariantOptionTypeValue < ActiveRecord::Base
  belongs_to :variant_option_type
  attr_accessible :description, :name
end
