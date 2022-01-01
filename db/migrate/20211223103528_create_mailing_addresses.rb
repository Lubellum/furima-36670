class CreateMailingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :mailing_addresses do |t|
      t.string     :postal_code          , null: false
      t.integer    :ship_from_address_id , null: false
      t.string     :municipalities       , null: false
      t.string     :street_number        , null: false
      t.string     :building_name
      t.string     :telephone_number     , null: false
      t.references :purchase_record      , null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
