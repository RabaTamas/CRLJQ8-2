class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items

  validates :name, :email, :address, presence: true

  def calculate_total
    update(total: order_items.sum { |i| i.unit_price * i.quantity })
  end
end

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book

  validates :quantity, numericality: { greater_than: 0 }
end
