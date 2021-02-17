class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence:true do
    validates :nickname
    validates :birthday
  end

  with_options presence:true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用して下さい'} do
    validates :last_name
    validates :first_name
  end

  with_options presence:true, format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カナ文字を使用して下さい'} do
    validates :last_name_read
    validates :first_name_read
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with:PASSWORD_REGEX, message: 'は英・数字の両方を含めて設定して下さい'

  has_many :items
  has_many :purchases

end
