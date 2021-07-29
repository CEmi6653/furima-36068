class ItemsController < ApplicationController
  def index
   @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :quality_id, :shipping_charge_id, :delivery_source_id, :delivery_day_id, :selling_price, :user_id)
  end
end
