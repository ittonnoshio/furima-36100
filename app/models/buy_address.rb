class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city, :house_num, :building, :phone

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :zip_code
    validates :city
    validates :house_num
    validates :phone
  end
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "Select"}
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "is invalid."}

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, house_num: house_num, building: building, phone: phone, buy_id: buy.id)
  end
end