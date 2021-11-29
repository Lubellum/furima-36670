class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname            , presence: true
  validates :password            , format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Include both letters and numbers" }
  validates :first_name_kanji    , presence: true, format: { with: /\A[一-龥]+\z/, message: "is invalid. Input full-width characters" }
  validates :last_name_kanji     , presence: true, format: { with: /\A[一-龥]+\z/, message: "is invalid. Input full-width characters" }
  validates :first_name_katakana , presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :last_name_katakana  , presence: true, format: { with: /\A([ァ-ン]|ー)+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :birth_date          , presence: true
end
