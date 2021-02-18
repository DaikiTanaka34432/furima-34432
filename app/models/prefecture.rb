class Prefecture < ActiiveHash::Base

  include ActiveHash::Associations
  has_many :items
  end