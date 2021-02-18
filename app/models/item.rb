class Item < ApplicationRecord
  with_options presence:true do
    validates :name
    validates :profile
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipment_days_id
    validates :fee
    validates :image
  end

  with_options numericality:{other_than: 1} do
    validates :category_id, :status_id, :delivery_fee_id, :prefecture_id, :shipment_days_id
  end

  has_one :purchase
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category   
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipment_days
end
