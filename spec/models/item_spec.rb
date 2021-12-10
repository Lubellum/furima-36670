require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    describe '商品情報' do
      context '商品出品が出来る時' do
        
      end

      context '商品出品が出来ない時' do
        
      end
    end

    describe '商品情報(ActiveHash)' do
      
    end
  end
end
