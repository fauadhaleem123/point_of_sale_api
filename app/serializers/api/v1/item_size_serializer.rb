class Api::V1::ItemSizeSerializer < ActiveModel::Serializer
  attributes :id, :code, :price, :quantity, :discount, :size_attributes

  def size_attributes
    { size_type: object.size.size_type, size_id: object.size_id }
  end
end 
