class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :order
  attr_accessor :token
end
