class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule_delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, numericality: {only_integer: true, message: 'Half-size number' }
  end
  validates :price, inclusion: {in: (300..9999999)}
  
  with_options numericality: { other_than: 1, message: "Select" } do
  validates :category_id 
  validates :sales_status_id
  validates :shipping_fee_id
  validates :prefecture_id
  validates :schedule_delivery_id
  end
end
