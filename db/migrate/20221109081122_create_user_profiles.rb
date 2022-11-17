class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :full_name
      t.string :email
      t.integer :age
      t.string :gender
      t.string :mobile_no
      t.text :bio
      t.string :image_upload
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
