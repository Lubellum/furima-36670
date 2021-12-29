class MailingAddressesController < ApplicationController
  def index
    @purchase_mailing = PurchaseMailing.new
  end

  def create
    @purchase_mailing = PurchaseMailing.new(purchase_mailing_params)
    if @purchase_mailing.valid?
      @purchase_mailing.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_mailing_params
    params.require(:purchase_mailing).permit(:postal_code, :ship_from_address_id, :municipalities, :street_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item_id)
  end
end
