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
          binding.pry
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end

    describe '商品情報(ActiveHash)' do
      
    end
  end
end
