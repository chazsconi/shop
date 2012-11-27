class AddVatExemptToProducts < ActiveRecord::Migration
  def change
    add_column :products, :VAT_exempt, :boolean
  end
end
