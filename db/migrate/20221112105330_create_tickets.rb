class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :ticket_no
      t.integer :number_of_vip_tickets
      t.integer :number_of_regular_tickets
      t.belongs_to :user, foreign_key: true
      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end
