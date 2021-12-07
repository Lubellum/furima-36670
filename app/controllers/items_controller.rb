class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.create(item_params)
    if @item.save 
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, 
                                 :category_id, :condition_id, :delivery_fee_payment_id, 
                                 :ship_from_address_id, :ship_to_duration_id, :explanation, :price)
                                 .merge(user_id: current_user.id)
  end
end
