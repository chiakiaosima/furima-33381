class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @address_purchase = AddressPurchase.new
  end

  
  def create
    @purchase = AddressPurchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    # binding.pry
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:address_purchase).permit(:postalcode, :region_id, :city, :street, :building_name, :tel, :item_id).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end

