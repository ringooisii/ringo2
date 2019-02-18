class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :user_id
    	t.string  :order_name, null: false
    	t.string  :order_address, null: false
    	t.integer :order_status, null: false, default: 0
      t.timestamps
    end
  end
end

#rails db:migrate:reset