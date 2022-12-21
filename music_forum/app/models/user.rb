class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable

  validates :login, presence: true, length: { maximum: 15 }, uniqueness: { message: "User with such login already exist" }
  validates :email, presence: true, format: { with: Devise.email_regexp }, uniqueness: { message: "User with such email already exist" }
  validates :encrypted_password, presence: true, length: { minimum: 8 }, uniqueness: { message: "User with such pussword already exist" }
end