class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable


  has_many :products, through: :carts
  has_many :carts
  has_many :order_products
  has_many :orders
  has_many :shippings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana,presence: true
  validates :last_name_kana,presence: true
  validates :postcode, presence: true
  validates :address, presence: true


  def self.from_omniauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
  end

  # def self.from_omniauth(auth)
  #   User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #   user.email = auth.info.email
  #   user.password = Devise.friendly_token[0,20]
  #   # user.name = auth.info.name   # assuming the user model has a name
  #   user.first_name = "aaa"   # assuming the user model has a name
  #   # user.image = auth.info.image # assuming the user model has an image
  #   # If you are using confirmable and the provider(s) you use validate emails,
  #   # uncomment the line below to skip the confirmation emails.
  #   # user.skip_confirmation!
  # end
# end

end
