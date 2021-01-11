class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_origin_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :purchase_id, :token

  validates :shipping_origin_id, numericality: { other_than: 1 } 

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly" }
    validates :city
    validates :address
    validates :phone_number, format: { with:/\A\d{11}\z/, message: "Input only number" }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_origin_id: shipping_origin_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id )
  end
end