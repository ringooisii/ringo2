class Song < ApplicationRecord
	belongs_to :disc
	validates :title, presence: true
	validates :song_number, presence: true
end
