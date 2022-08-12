class RecordAddress
  include ActiveModel::Model
  attr_accessor :address_number, :item_address_id, :address_city, :address_house, :address_building,:phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :address_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "(-)ハイフンを使って入力してください"}
    validates :address_house
    validates :address_city
    validates :phone_number,format: {with: /\A[0-9]{10,11}\z/}
    validates :token
  end
  validates :item_address_id, numericality: {other_than: 1, message: "を入力してください"}

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(address_number: address_number, item_address_id: item_address_id, address_city: address_city, address_house: address_house, address_building: address_building, phone_number: phone_number, record_id: record.id)
  end
end 