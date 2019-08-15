class Api::V1::ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:update, :destroy]

  def index
    render json: Item.all, :include => {:category => {:only => [:name, :id]}}
  end

  def update
    @item.update(item_params)
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json:"Item created successfully", status: :created
    else
      render json: 'Something went wrong! Please try again', status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy!
  end

  private
  def item_params
    params.permit(:name, :category_id, :code, :current_stock, :sale_price)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
