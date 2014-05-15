class Event < ActiveRecord::Base
	has_many :registrations, foreign_key: "signed_up_event_id", dependent: :destroy
	has_many :signed_up_users, through: :registrations
	
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true
	validates :content, presence: true
	validates :date, presence: true, length: { maximum: 50 }
	validates :location, presence: true, length: { maximum: 50 }
	validates :user_id, presence: true

	def self.search(search)
		if search
			find(:all, :conditions => ['lower(name) LIKE ?', "%#{search}%".downcase])
		else
			find(:all)
		end
	end

	def signed_up?(user)
		registrations.find_by(signed_up_user_id: user.id)
	end

	def signup!(user)
		registrations.create!(signed_up_user_id: user.id)
	end

	def unsignup!(user)
		registrations.find_by(signed_up_user_id: user.id).destroy
	end

	private
end