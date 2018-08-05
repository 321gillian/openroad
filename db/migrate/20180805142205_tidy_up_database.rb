class TidyUpDatabase < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :order_status_id
    
  end
end
