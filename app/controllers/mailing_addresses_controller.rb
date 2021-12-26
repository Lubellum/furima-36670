class MailingAddressesController < ApplicationController
  def index
    @mailing_address = MailingAddress.new
  end

  def create
  end
end
