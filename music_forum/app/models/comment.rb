class Comment < ApplicationRecord
  belongs_to :review

  validates :text, presence: true, length: { maximum: 500 }
end
