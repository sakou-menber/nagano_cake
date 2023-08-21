class Order < ApplicationRecord

  enum payment_method: { credit_card: 1, transfer: 2 }


  has_many :order_details, dependent: :destroy
  belongs_to :custome
  
end
