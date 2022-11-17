class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :event_start_date
      t.datetime :event_end_date
      t.string :ticket_format
      t.datetime :early_booking_end_date
      t.integer :early_booking_price_regular
      t.integer :early_booking_price_vip
      t.string :location
      t.integer :regular_price
      t.integer :vip_price
      t.integer :vip_no_of_tickets
      t.integer :regular_no_of_tickets
      t.text :description
      t.string :banner_img
      t.string :image_url1
      t.string :image_url2
      t.belongs_to :user, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
