class Comment < ApplicationRecord
  belongs_to :user

  validates :text, presence: true, length: { maximum: 500 }
end
