class Book < ApplicationRecord
  belongs_to :category, optional: true
  has_many :order_items

  validates :title,  presence: true
  validates :author, presence: true
  validates :price,  presence: true, numericality: { greater_than: 0 }

  scope :featured, -> { where(featured: true) }
  scope :by_category, ->(cat_id) { where(category_id: cat_id) if cat_id.present? }
  scope :search, ->(q) {
    where("title LIKE :q OR author LIKE :q", q: "%#{q}%") if q.present?
  }
  scope :price_range, ->(min, max) {
    scope = all
    scope = scope.where("price >= ?", min.to_i) if min.present?
    scope = scope.where("price <= ?", max.to_i) if max.present?
    scope
  }

  def formatted_price
    "#{price.to_i} Ft"
  end
end
