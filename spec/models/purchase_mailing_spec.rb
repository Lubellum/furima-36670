require 'rails_helper'

RSpec.describe PurchaseMailing, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_mailing = FactoryBot.build(:purchase_mailing, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入が出来る時' do
      it '郵便番号、都道府県、市区町村、番地、建物名、電話番号、tokenがあれば購入が出来る' do
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
        expect(@purchase_mailing.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にはハイフン(-)が必須' do
        @purchase_mailing.postal_code = '1234567'
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号は半角文字の必要がある' do
        @purchase_mailing.postal_code = '１２３-４５６７'
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号は「数字3桁-数字4桁」の必要がある(4桁-4桁)' do
        @purchase_mailing.postal_code = '1234-5678'
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号は「数字3桁-数字4桁」の必要がある(3桁-5桁)' do
        @purchase_mailing.postal_code = '123-45678'
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県の選択が必須' do
        @purchase_mailing.ship_from_address_id = ''
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include("Ship from address can't be blank")
      end
      it '都道府県の選択はidが1以外の必要がある' do
        @purchase_mailing.ship_from_address_id = '1'
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include('Ship from address must be other than 1')
      end
      it '都道府県の選択は数字での入力が必須' do
        @purchase_mailing.ship_from_address_id = 'a'
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include('Ship from address is not a number')
      end
      it '市区町村が必須' do
        @purchase_mailing.municipalities = ''
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が必須' do
        @purchase_mailing.street_number = ''
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include("Street number can't be blank")
      end
      it '電話番号が必須' do
        @purchase_mailing.telephone_number = ''
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号は10桁〜11桁の必要がある(9桁)' do
        @purchase_mailing.telephone_number = '123456789'
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号は10桁〜11桁の必要がある(12桁)' do
        @purchase_mailing.telephone_number = '123456789012'
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号は半角数字の必要がある(全角数字)' do
        @purchase_mailing.telephone_number = '１２３４５６７８９０'
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号は半角数字の必要がある(全角数字)' do
        @purchase_mailing.telephone_number = 'abcdefghij'
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'userが紐付いていないと購入出来ない' do
        @purchase_mailing.user_id = nil
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入出来ない' do
        @purchase_mailing.item_id = nil
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが無いと購入出来ない' do
        @purchase_mailing.token = nil
        @purchase_mailing.valid?
        expect(@purchase_mailing.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
