class MailingAddressesController < ApplicationController
  def index
  end

  def create
    @mailing_address = MailingAddress.new(mailing_address_params)
    if @mailing_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def mailing_address_params
    params.permit(:postal_code, :ship_from_address_id, :municipalities, 
                                            :street_number, :building_name, :telephone_number)
  end
end
