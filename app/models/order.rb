class Order < ApplicationRecord
  
  has_many :orders, dependent: :destroy
  
end
