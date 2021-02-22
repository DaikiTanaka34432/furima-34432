class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :house_name, :telephone, :item, :user_id

  with_options presence: true do
    validates :postal_code, format:{with:  /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. ハイフン(-)を入れてください"}
    validates :prefecture_id, numericality:{other_than: 0, message: "can't be blank"}
    validates :city
    validates :house_number
    validates :telephone format:{with: /\A\d{11}\z/, message: "is invalid. 11桁の数値で入力してください"}
    validates :item
    validates :user_id
  end

  def save
    order = Order.create(item: item, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, house_name: house_name, telephone: telephone, order_id: order.id)
  end
end