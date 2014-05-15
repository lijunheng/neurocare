class Event < ActiveRecord::Base
	validates :name, presence: true
	validates :content, presence: true
	validates :date, presence: true, length: { maximum: 50 }
	validates :location, presence: true, length: { maximum: 50 }
end