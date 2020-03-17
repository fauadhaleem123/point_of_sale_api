class Api::V1::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :item_sizes_attributes

  def category
    object.category.name
  end

  def item_sizes_attributes
    ActiveModel::SerializableResource.new(object.item_sizes, each_serializer: Api::V1::ItemSizeSerializer)
  end
end
 