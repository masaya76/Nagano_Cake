class OrderDetail < ApplicationRecord
  
  has_many :itemss, dependent: :destroy
  has_many :orders, dependent: :destroy
  
end
