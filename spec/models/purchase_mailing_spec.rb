require 'rails_helper'

RSpec.describe PurchaseMailing, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_mailing = FactoryBot.build(:purchase_mailing, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入が出来る時' do
      it '郵便番号、都道府県、市区町村、番地、建物名、電話番号があれば購入が出来る' do
        expect(@purchase_mailing).to be_valid
      end
      it '建物名が無くても購入できる' do
        @purchase_mailing.building_name = nil
        expect(@purchase_mailing).to be_valid
      end
    end

    context '商品購入が出来ない時' do
      it '郵便番号が必須' do
        @purchase_mailing.postal_code = ''
        @purchase_mailing.valid?
        binding.pry
        expect(@purchase_mailing.errors.full_messages).to include("Postal code can't be blank")
      end
    end
  end
end
