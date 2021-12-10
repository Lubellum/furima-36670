require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    describe '商品情報' do
      context '商品出品が出来る時' do
        it '商品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格があれば出品が出来る' do
          expect(@item).to be_valid
        end
      end

      context '商品出品が出来ない時' do
        it '商品画像が必須' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が必須' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it '商品の説明が必須' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it '販売価格が必須' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '販売価格は半角数字での入力が必須である(全角数字)' do
          @item.price = '１２３４'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it '販売価格は半角数字での入力が必須である(半角文字)' do
          @item.price = 'abcd'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it '販売価格は300円〜9,999,999円の範囲での入力が必須である(300円未満)' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it '販売価格は300円〜9,999,999円の範囲での入力が必須である(10,000,000円以上)' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
      end
    end

    describe '商品情報(ActiveHash)' do
      context '商品出品が出来ない時' do
        it 'カテゴリーの選択が必須' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'カテゴリーの選択はidが1以外の必要がある' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it 'カテゴリーの選択は数字での入力が必須' do
          @item.category_id = 'a'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number")
        end
        it '商品の状態の選択が必須' do
          @item.condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
        it '商品の状態の選択はidが1以外の必要がある' do
          @item.condition_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end
        it '商品の状態の選択は数字での入力が必須' do
          @item.condition_id = 'a'
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition is not a number")
        end
        it '配送料の負担の選択が必須' do
          @item.delivery_fee_payment_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee payment can't be blank")
        end
        it '配送料の負担の選択はidが1以外の必要がある' do
          @item.delivery_fee_payment_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee payment must be other than 1")
        end
        it '配送料の負担の選択は数字での入力が必須' do
          @item.delivery_fee_payment_id = 'a'
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee payment is not a number")
        end
        it '発送元の地域の選択が必須' do
          @item.ship_from_address_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship from address can't be blank")
        end
        it '発送元の地域の選択はidが1以外の必要がある' do
          @item.ship_from_address_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship from address must be other than 1")
        end
        it '発送元の地域の選択は数字での入力が必須' do
          @item.ship_from_address_id = 'a'
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship from address is not a number")
        end
        it '発送までの日数の選択が必須' do
          @item.ship_to_duration_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship to duration can't be blank")
        end
        it '発送までの日数の選択はidが1以外の必要がある' do
          @item.ship_to_duration_id = '1'
          @item.valid?
          binding.pry
          expect(@item.errors.full_messages).to include("Ship to duration must be other than 1")
        end
      end
    end
  end
end
