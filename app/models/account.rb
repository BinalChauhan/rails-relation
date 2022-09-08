class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_one :cart
  extend FriendlyId
  friendly_id :email, use: :slugged
  validates :firstname, :lastname, presence: true
end
