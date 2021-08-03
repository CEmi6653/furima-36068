class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @donation_address = DonationAddress.new
  end                   

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @donation_address = DonationAddress.new(order_params)
    if @donation_address.valid?
      @donation_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def order_params
    params.permit(:postal_code, :delivery_source_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
