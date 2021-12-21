class PurchaseMailing
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_from_address_id, :municipalities, :street_number, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validetes :postal_code          , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validetes :ship_from_address_id , numericality: {other_than: 0, message: "can't be blank"}
    validetes :municipalities
    validetes :street_number
    validetes :telephone_number     , format: {with: /\A[0-9]{11}\z/}
    validetes :user_id
    validetes :item_id
  end
end