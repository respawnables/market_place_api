class Order < ApplicationRecord
  before_validation :set_total!

  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  belongs_to :user

  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def set_total!
    self.total = products.sum :price
  end
end
