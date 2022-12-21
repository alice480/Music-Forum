class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable

  has_many :reviews
  has_many :comments

  validates :login, presence: true,
                    length: { maximum: 15, message: 'Максимальная длина логина: 15 символов' },
                    uniqueness: { message: 'Логин занят' }
  validates :email, presence: true,
                    format: { with: Devise.email_regexp },
                    uniqueness: { message: 'Email занят' }
  validates :encrypted_password, presence: true,
                                 length: { minimum: 8, message: 'Минимальная длина пароля: 8 символов' }
end