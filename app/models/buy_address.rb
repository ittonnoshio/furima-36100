class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city, :house_num, :building, :phone, :buy_id

  with_options presence: true do
    validates :item_id
    validates :user_id
  end

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :house_num
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :buy_id
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, house_num: house_num, building: building, phone: phone, buy_id: buy.id)
  end
end