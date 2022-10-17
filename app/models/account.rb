class Account < ApplicationRecord
    require 'open-uri'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :linkedin]
  has_one_attached :image
  has_one :cart
  has_many :orders

  extend FriendlyId
  friendly_id :email, use: :slugged
  validates :firstname, :lastname, presence: true
  def self.from_omniauth(access_token)
      data = access_token.info
      account = Account.where(email: data["email"]).first
      name_split = data.name.split(" ")
      fname = name_split[0]
      lname = name_split[1]
      unless account
          password = Devise.friendly_token[0,20]
          account = Account.create!(firstname: fname,lastname: lname,
                                    email: data["email"], password: password, password_confirmation: password)
      end
      account.image.attach(io: URI.open(data["image"]), filename: "UserProfile#{account.id}")
      account
  end
    # def self.from_omniauth(auth)
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #     user.email = auth.info.email
    #     user.first_name = auth.info.first_name
    #     user.last_name = auth.info.last_name
    #     user.picture_url = auth.info.picture_url
    #     user.password = Devise.friendly_token[0, 20]
    # end
    # end
end