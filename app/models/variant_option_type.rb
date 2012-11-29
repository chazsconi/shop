class VariantOptionType < ActiveRecord::Base
  attr_accessible :description, :display_name, :name
  has_many :variant_option_type_values
end
