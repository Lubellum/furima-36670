class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee_payment
  belongs_to :ship_from_address
  belongs_to :ship_to_duration

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :delivery_fee_payment_id
    validates :ship_from_address_id
    validates :ship_to_duration_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_payment_id
    validates :ship_from_address_id
    validates :ship_to_duration_id
  end

  validates :item_name, length: { maximum: 40 }
  validates :explanation, length: { maximum: 1000 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
