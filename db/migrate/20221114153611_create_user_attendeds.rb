class CreateUserAttendeds < ActiveRecord::Migration[7.0]
  def change
    create_table :user_attendeds do |t|
      t.integer :vip_tickets
      t.integer :regular_tickets
      t.float :total_amount
      t.belongs_to :event, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
