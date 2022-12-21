class Review < ApplicationRecord
  belongs_to :user

  validates :topic, presence: true, length: { maximum: 100 }
  validates :text, presence: true, length: { maximum: 1500 }
end
