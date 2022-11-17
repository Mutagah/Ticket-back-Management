class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :callback
      t.string :CheckoutRequestID
      t.string :MerchantRequestID

      t.timestamps
    end
  end
end
