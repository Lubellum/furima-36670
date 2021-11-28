class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname            , presence: true
  validates :first_name_kanji    , presence: true, format: { with: /\A[一-龥]+\z/ }
  validates :last_name_kanji     , presence: true, format: { with: /\A[一-龥]+\z/ }
  validates :first_name_katakana , presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :last_name_katakana  , presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birth_date          , presence: true
end
