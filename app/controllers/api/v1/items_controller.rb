class Api::V1::ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:update, :destroy]

  def index 
    collection = ItemSizeCollection.new(params)
    total_records = collection.meta
    items = Item.paginate( :page => params[:page]).includes(:category, item_sizes: :size)
    
    render json: {
      page: items.current_page,
      pages: items.total_pages,
      total: total_records,
      items: ActiveModel::SerializableResource.new(items, each_serializer: Api::V1::ItemSerializer)
    }
  end 
 
  def update
    @item.update(item_params)
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: 'Item created successfully', status: :created
    else
      render json: 'Something went wrong! Please try again', status: :unprocessable_entity
    end
  end

  def destroy
    # @item.destroy!
     @size = Size.find(params[:size])
     @item.sizes.destroy(@size)
    if @item.sizes.count == 0
      @item.destroy
    end
  end

  private

  # def delete_params 
  #   params.permit(:id, :size_id)
  # end
  
  def item_params
    params.require(:item).permit(:id, :name, :category_id, :item_sizes_attributes =>  [:id,:code, :quantity, :price, :discount, :size_attributes => [:size_type, :id]])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def all_items
    collection = ItemsCollection.new(params)
    collection.meta
  end
end
