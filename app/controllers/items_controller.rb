class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(category_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private 

  def item_params
    params.require(:category).permit(category_id)
  end
end
