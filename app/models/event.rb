class Event < ActiveRecord::Base
	belongs_to :user
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

	private
end