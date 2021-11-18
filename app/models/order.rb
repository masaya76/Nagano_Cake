class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum peyment_method: { credit_card: 0, transfer: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4,}

  def self.male(postage)
    new(postage = 800)
  end

  def subtotal_order
    sum = 0
    order_details.each do |order_detail|
      sum += order_detail.subtotal_detail()
    end
    return sum
  end



end
