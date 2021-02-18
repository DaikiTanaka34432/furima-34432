class Shipment_days < ActiiveHash::Base

  include ActiveHash::Associations
  has_many :items
  end