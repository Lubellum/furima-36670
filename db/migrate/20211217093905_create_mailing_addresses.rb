class CreateMailingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :mailing_addresses do |t|

      t.timestamps
    end
  end
end
