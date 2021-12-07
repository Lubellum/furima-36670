class Item < ApplicationRecord
  belongs_to :user

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

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_payment_id
      validates :ship_from_address_id
      validates :ship_to_duration_id
    end
  end
end
