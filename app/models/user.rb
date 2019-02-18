class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :order_products
  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana,presence: true
  validates :last_name_kana,presence: true
  validates :postcode, presence: true
  validates :address, presence: true

end
