class PagesController < ApplicationController
  before_action :authenticate_user!, :only => [:account]

  def home
  end

  def about
  end

  def account
    @lessons = user_orders
    @user = current_user
  end 

  private def user_orders
   OrderItem.select("lessons.start_time as lesson_start, order_items.order_id as order_id, orders.user_id as user_id, lessons.meeting_point as meeting_point, orders.order_status as status").joins(:order, :lesson).where('orders.user_id = ? AND orders.order_status = ?', current_user.id, 1)
  end 

end
