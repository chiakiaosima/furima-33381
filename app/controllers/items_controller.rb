class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end



  private 

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :subscriber_id, :region_id, :lead_time_id, :price ).merge(user_id: current_user.id)
  end
end
