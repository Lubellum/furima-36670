class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname            , null: false
  validates :first_name_kanji    , null: false
  validates :last_name_kanji     , null: false
  validates :first_name_katakana , null: false
  validates :last_name_katakana  , null: false
  validates :birth_date          , null: false
end
