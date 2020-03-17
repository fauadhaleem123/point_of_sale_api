class Customers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :code
      t.string :name
      t.string :phone_number
      t.text :address
      t.text :details

      t.timestamps  
    end
  end
end
