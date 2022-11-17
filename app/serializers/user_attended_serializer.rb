class UserAttendedSerializer < ActiveModel::Serializer
  attributes :id, :vip_tickets, :regular_tickets, :total_amount, :event_id, :user_id
end
