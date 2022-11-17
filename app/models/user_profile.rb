class UserProfile < ApplicationRecord
    belongs_to :user
    has_many :user_attendeds, through: :user
    has_many :events, through: :user
    has_many :payments, through: :user
end
