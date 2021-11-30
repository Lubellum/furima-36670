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
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性である' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスは、@を含む必要がある' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードが必須である' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須である' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードは、半角英数字混合での入力が必須である(英字のみ)' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'パスワードは、半角英数字混合での入力が必須である(数字のみ)' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須である' do
        @user.password = '123abc' 
        @user.password_confirmation = '456def'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
    
    context '本人確認情報' do
      it 'お名前(全角)は、名字と名前がそれぞれ必須である(名字のみ)' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it 'お名前(全角)は、名字と名前がそれぞれ必須である(名前のみ)' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須である(名字_漢字)' do
        
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須である(名字_ひらがな)' do
        
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須である(名字_カタカナ)' do
        
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須である(名前_漢字)' do

      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須である(名前_ひらがな)' do
        
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須である(名前_カタカナ)' do
        
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
