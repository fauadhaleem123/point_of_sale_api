class AddSizeeToSoldItems < ActiveRecord::Migration[5.2]
  def change
    add_column :sold_items, :size, :string
  end
end
