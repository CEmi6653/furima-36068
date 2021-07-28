class Item < ApplicationRecord
  with_options presence:true do
    validates :name
    validates :explanation
    validates :category_id
    validates :quality_id
    validates :shipping_charge_id
    validates :delivery_source_id
    validates :delivery_day_id
    validates :selling_price, numricality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: {with: /\A[0-9]+\z/ }
  end
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associatins::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :shipping_charge
  belongs_to :delivery_source
  belongs_to :delivery_day
end
