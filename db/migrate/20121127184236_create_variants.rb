class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :code

      t.timestamps
    end
  end
end
