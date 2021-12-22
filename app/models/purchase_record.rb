class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :mailing_address
end
