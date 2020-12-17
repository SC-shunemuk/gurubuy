class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :address_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address_number
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :user_id
    validates :item_id
  end

end
