class Item < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :comments, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_method
  belongs_to :prefecture
  belongs_to :joint_buying
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
    validates :category_id
    validates :joint_buying_id
    validates :prefecture_id
    validates :shipping_method_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :prefecture_id
    validates :shipping_method_id
  end

  validates :joint_buying_id, numericality: { other_than: 0 }

  def self.search(search)
    if search != ""
      Item.where('content LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
