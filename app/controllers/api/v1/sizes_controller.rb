class Api::V1::SizesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Size.all
  end

  def create
    size = Size.new(size_params)
    if size.save
      render json: 'Item created successfully', status: :created
    else
      render json: 'Something went wrong! Please try again', status: :unprocessable_entity
    end
  end

  private
  def size_params
    params.permit( :id, :size_type)
  end
end
