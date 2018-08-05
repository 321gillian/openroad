class Order < ApplicationRecord
  enum order_status: [:active, :complete]
  scope :completed, -> { where(order_status: complete) }
  has_many :order_items
  belongs_to :user
  has_many :lessons, through: :order_items
  before_validation :set_order_status, on: :create
  before_save :update_subtotal


  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private
  def set_order_status
    self.order_status ||= :active
  end


  def update_subtotal
    self[:subtotal] = subtotal
  end

end
