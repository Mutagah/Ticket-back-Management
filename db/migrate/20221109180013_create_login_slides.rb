class CreateLoginSlides < ActiveRecord::Migration[7.0]
  def change
    create_table :login_slides do |t|
      t.string :title
      t.string :image_url

      t.timestamps
    end
  end
end
