class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :text, presence: true
  validates :text, length: {maximum: 300}
end
