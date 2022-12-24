# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :comments

  validates :login,
            presence: true,
            length: { maximum: 15, message: 'Максимальная длина логина: 15 символов' },
            uniqueness: { message: 'Логин занят' }
  validates :email,
            presence: true,
            format: { with: Devise.email_regexp },
            uniqueness: { message: 'Email занят' }
  validates :encrypted_password,
            presence: true,
            length: { minimum: 8, message: 'Минимальная длина пароля: 8 символов' }

  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "200x200!").processed
    else
      '/default_avatar.jpeg'
    end
  end

  private

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(
      io: File.open(
        Rails.root.join(
          'app', 'assets', 'images', 'default_avatar.jpeg'
        )
      ), filename: 'default_avatar.jpeg',
      content_type: 'image/jpeg'
    )
  end
end
