class Order < ApplicationRecord
  include ActiveModel::Validations

  before_validation :set_total!

  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  belongs_to :user

  validates_with EnoughProductsValidator

  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def set_total!
    self.total = placements.map { |placement| placement.product.price * placement.quantity }.sum
  end

  def build_placements_with_product_ids_and_quantities(product_ids_and_quantities)
    product_ids_and_quantities.each do |product_ids_and_quantity|
      placement = placements.build(product_id: product_ids_and_quantity[:product_id],
                                   quantity: product_ids_and_quantity[:quantity])
      yield placement if block_given?
    end
  end
end
