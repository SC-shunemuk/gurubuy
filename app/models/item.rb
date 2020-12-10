class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :shipping_method
  belongs_to :prefecture
  belongs_to :joint_buying
  has_one_attached :image
end
