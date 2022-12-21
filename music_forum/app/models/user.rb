class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable

  validates :login, presence: true, length: { maximum: 15 }, unique: true
  validates :email, presence: true, unique: true, format: { with: Devise.email_regexp }
  validates :encrypted_password, presence: true, length: { minimum: 8 }, unique: true
end
