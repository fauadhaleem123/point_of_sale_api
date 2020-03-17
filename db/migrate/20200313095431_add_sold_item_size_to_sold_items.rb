class AddSoldItemSizeToSoldItems < ActiveRecord::Migration[5.2]
  def change
    add_column :sold_items, :sold_item_size, :string
  end
end
