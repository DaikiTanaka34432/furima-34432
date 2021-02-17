class Item < ApplicationRecord
  with options presence:true do
    validates :name
    validates :profile
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipment_days_id
    validates :fee
  end

  has_one :purchase
  belongs_to :user
  has_one_attached :image

end
