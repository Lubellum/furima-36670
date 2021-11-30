require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー情報' do
      it 'ニックネームが必須である' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須である' do
        @user.email = ''
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性である' do
        
      end
      it 'メールアドレスは、@を含む必要がある' do
        
      end
      it 'パスワードが必須である' do
        
      end
      it 'パスワードは、6文字以上での入力が必須である' do
        
      end
      it 'パスワードは、半角英数字混合での入力が必須である' do
        
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須である' do
        
      end
    end

    context '本人確認情報' do
      it 'お名前(全角)は、名字と名前がそれぞれ必須である' do
        
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須である' do
        
      end
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須である' do
        
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須である' do
        
      end
      it '生年月日が必須である' do
        
      end
    end
  end
end
