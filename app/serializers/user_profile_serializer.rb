class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :age, :gender, :bio, :image_upload, :user_id, :mobile_no

  has_many :user_attendeds
  has_many :events
  has_many :payments
end
