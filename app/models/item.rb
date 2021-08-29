class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40}
    validates :info, length: { maximum: 1000 }
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :sales_status
    belongs_to_active_hash :shipping_fee
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :scheduled_delivery
end