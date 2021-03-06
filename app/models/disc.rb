class Disc < ApplicationRecord
	belongs_to :product
	has_many :songs, inverse_of: :disc
	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true
	validates :disc_name, presence: true
	validates :disc_number, presence: true
end
