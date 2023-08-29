class Order < ApplicationRecord

  enum payment_method: { credit_card: 1, transfer: 2 }


  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  def item_amount
    amount = 0
    order_details.each do |order_detail|
      amount += order_detail.amount
    end
    return amount
  end

end
