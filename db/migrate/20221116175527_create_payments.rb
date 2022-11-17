class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :phone_number
      t.string :response
      t.integer :vip_tickets
      t.integer :regular_tickets
      t.integer :event_id
      t.string :ticket_format
      t.string :CheckoutRequestID
      t.string :MerchantRequestID
      t.boolean :state, default: false
      t.string :code
      t.belongs_to :user, foreign_key: true
      
      t.timestamps
    end
  end
end
