class AddSizeToSoldItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :sold_items, :size, foreign_key: true, index:true
  end
end
