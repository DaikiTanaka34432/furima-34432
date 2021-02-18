class Delivery_fee < ActiiveHash::Base

  include ActiveHash::Associations
  has_many :items
  end