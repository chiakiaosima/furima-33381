class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase
  before_action :move_to_root

  def index
    @address_purchase = AddressPurchase.new
  end

  
  def create
    @address_purchase = AddressPurchase.new(purchase_params)
    if @address_purchase.valid?
      pay_item
      @address_purchase.save
    return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:address_purchase).permit(:postalcode, :region_id, :city, :street, :building_name, :tel, :item_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    if current_user == @item.user or @item.purchase != nil
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end

