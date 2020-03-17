class RemoveSizeFromSoldItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :sold_items, :size, :string
  end
end
