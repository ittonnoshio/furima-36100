class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, numericality: true,
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }
    # validates :price, numericality: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, message: "must be greater than or equal to 300" }
    # validates :price, numericality: true, numericality: { only_integer: true,  less_than_or_equal_to: 9999999, message: "must be less than or equal to 9999999" }
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
end
