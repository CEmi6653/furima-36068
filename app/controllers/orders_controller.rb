class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :deliberation_item_order, only: [:index, :create]

  def index
    @donation_address = DonationAddress.new
   
    
  end

  def create
    @donation_address = DonationAddress.new(order_params)
    if @donation_address.valid?
      pay_item
      @donation_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def order_params
    params.require(:donation_address).permit(:postal_code, :delivery_source_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end


  def set_item
    @item = Item.find(params[:item_id])
  end

  def deliberation_item_order
    if current_user == @item.user
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end
  
  
end
