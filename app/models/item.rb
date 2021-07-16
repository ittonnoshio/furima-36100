class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id
    validates :state_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, numericality: true
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
end
