class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  def main_full_address
    〒 + postal_code + address
  end

  def full_name
    first_name + last_name
  end

  def full_name_kana
    first_name_kana + '' + last_name_kana
  end

end
