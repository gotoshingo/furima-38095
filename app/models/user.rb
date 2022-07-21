class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buys

  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :first_name_kana, presence: true
  validates :second_name_kana, presence: true
  validates :nick_name, presence: true
  validates :date_of_birth, presence: true

end