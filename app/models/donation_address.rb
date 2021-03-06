class DonationAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :municipalities, :building_name, :address, :telephone_number, :delivery_source_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/}
    validates :delivery_source_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :token
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)    

    OrderAddress.create(postal_code: postal_code, municipalities: municipalities, building_name: building_name, address: address, telephone_number: telephone_number, delivery_source_id: delivery_source_id, order_id: order.id)
  end
end
