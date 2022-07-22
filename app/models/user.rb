class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :items
  #has_many :buys



  validates :nick_name, presence: true
  validates :date_of_birth, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do  
    validates :first_name
    validates :second_name
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :second_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
end