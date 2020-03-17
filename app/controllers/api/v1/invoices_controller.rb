class Api::V1::InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:show]

  def index
    puts "aa" * 1000
    render json: all_invoices.to_json(:include => [:sold_items => {:include => [:item]}])
  end

  def show
    render json: (@invoice.attributes.merge("sold_items":@invoice.sold_items.joins(:item).select('sold_items.*,items.name'),"discount": @invoice.discount))
  end

  def create
    if params[:invoice_id]
      @invoice = current_user.invoices.find(params[:invoice_id])
      @invoice.sold_items.destroy_all
      if @invoice.update(invoice_params)
        render json: @invoice, status: :created
      else
        render json: @invoice.errors, status: :unprocessable_entity
      end
    else
      @invoice = current_user.invoices.new(invoice_params)
      if @invoice.save!
        render json: @invoice, status: :created
      else
        render json: @invoice.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @invoice = Invoice.find params[:id]
    @invoice.destroy!
    render json: "Invoice Deleted"
  end

  private

    def set_invoice
      @invoice = Invoice.joins(:creator).select("invoices.*,users.email as creator_name").find_by("invoices.id=?",params[:id])
    end

    def all_invoices
      puts "aAAA" * 1000
      puts params
      collection = InvoicesCollection.new(params)
      collection.meta
    end

    def invoice_params
      params.require(:invoice).permit(:total, :status, :adjustment, :discount_id, sold_items_attributes: [:item_id, :size_id , :sold_item_size,  :unit_price, :quantity, :discount])
    end
end
