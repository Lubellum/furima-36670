class PurchaseMailing
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_from_address_id, :municipalities, :street_number, :building_name, :telephone_number,
                :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :ship_from_address_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :street_number
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    MailingAddress.create(postal_code: postal_code, ship_from_address_id: ship_from_address_id, municipalities: municipalities, street_number: street_number,
                          building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchase.id)
  end
end
