class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  with_options presence:true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用して下さい'} do
    validates :last_name
    validates :first_name
  end
  with_options presence:true, format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カナ文字を使用して下さい'} do
    validates :last_name_read
    validates :first_name_read
  end
  validates :birthday, presence: true

  has_many :items
  has_many :purchases

end
