class Api::V1::CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_customer, only:[:destroy, :update]

  def index
    render json: all_customers
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: 'Customer created successfully', status: :created
    else
      render json: 'Something went wrong! pleasse try again', status: :unprocessable_entity
    end
  end

  def update
    @customer.update(customer_params)
  end

  def destroy
    @customer.destroy!
  end

  private

  def get_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.permit(:code, :name, :phone_number, :address)
  end

  def all_customers
    collection = CustomersCollection.new(params)
    collection.meta
  end
end 
