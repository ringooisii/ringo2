class Shipping < ApplicationRecord
	belongs_to :user
	validates :shipping_address, presence: true
	validates :shipping_postcode, presence: true
	validates :shipping_name, presence: true
end
