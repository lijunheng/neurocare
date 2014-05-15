class Registration < ActiveRecord::Base
	belongs_to :signed_up_user, class_name: "User"
	belongs_to :signed_up_event, class_name: "Event"
	validate :signed_up_user_id, presence: true
	validate :signed_up_event_id, presence: true
end
