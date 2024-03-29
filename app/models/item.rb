class Item < ApplicationRecord

  has_one :record
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_dey 
  belongs_to :delivery_category 
  belongs_to :item_address 
  belongs_to :item_condition 
  belongs_to :item_category 





  validates :image, presence: true
  validates :item_name, presence: true, length: {maximum: 40}
  validates :item_category_id,  numericality: { other_than: 1 , message: "を入力してください"}
  validates :item_condition_id,  numericality: { other_than: 1 , message: "を入力してください"}
  validates :item_address_id,  numericality: { other_than: 1 , message: "を入力してください"}
  validates :item_explanation, presence: true,length: {maximum: 1000}
  validates :delivery_category_id,  numericality: { other_than: 1 , message: "を入力してください"}
  validates :delivery_dey_id,  numericality: { other_than: 1 , message: "を入力してください"}
  validates :price,  presence: true,numericality: {only_integer: true,greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 }



end
