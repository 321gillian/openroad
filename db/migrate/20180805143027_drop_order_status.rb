class DropOrderStatus < ActiveRecord::Migration[5.2]
  def change
    drop_table :order_statuses
  end
end
