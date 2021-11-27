class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname            , null: false
  validates :first_name_kanji    , null: false, format: { with: /\A[一-龥]+\z/ }
  validates :last_name_kanji     , null: false, format: { with: /\A[一-龥]+\z/ }
  validates :first_name_katakana , null: false, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :last_name_katakana  , null: false, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birth_date          , null: false
end
