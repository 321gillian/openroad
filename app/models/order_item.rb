class OrderItem < ApplicationRecord
  belongs_to :lesson
  belongs_to :order
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :lesson_present
  validate :order_present

  before_save :finalize
  before_save :set_lesson_status
  before_destroy :set_lesson_available

  def unit_price
    if persisted?
      self[:unit_price]
    else
      lesson.price
    end
  end

  private

  def lesson_present
    if lesson.nil?
      errors.add(:lesson, "is not valid.")
    end
  end

  def set_lesson_status
    lesson.unavailable!
  end 

  def set_lesson_available
    lesson.available!
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end  
  def finalize
    self[:unit_price] = unit_price
  end
end
