class MailingAddressesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_mailing = PurchaseMailing.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_mailing = PurchaseMailing.new(purchase_mailing_params)
    if @purchase_mailing.valid?
      pay_item
      @purchase_mailing.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_mailing_params
    params.require(:purchase_mailing).permit(:postal_code, :ship_from_address_id, :municipalities, :street_number, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchase_mailing_params[:price],
      card: purchase_mailing_params[:token],
      currency: 'jpy'
    )
  end
end
