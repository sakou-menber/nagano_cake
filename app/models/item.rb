class Item < ApplicationRecord
  has_one_attached :image

  def get_image
    # unless image.attached?
    #   file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    #   image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    # end
     image.variant(resize_to_limit: [100, 100]).processed
  end

   def add_tax_sales_price
     (self.price * 1.10).round
   end

end
