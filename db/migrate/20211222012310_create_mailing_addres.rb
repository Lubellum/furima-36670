class CreateMailingAddres < ActiveRecord::Migration[6.0]
  def change
    create_table :mailing_addres do |t|

      t.timestamps
    end
  end
end
