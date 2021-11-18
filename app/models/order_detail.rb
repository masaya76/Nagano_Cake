class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  def postage
    800
  end

  def subtotal_detail
    item.with_tax_price * amount
  end

  def subtotal
    get_payment * amount
  end


  # def self.order_detail_amount
  #   sum = 0
  #   order_details_amount.each do |f|
  #     sum += f.amount(:order_detail)
  #   end
  #   return sum
  # end


  enum making_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }

end