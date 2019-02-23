class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
    	t.integer :order_id
    	t.integer :product_id
    	t.integer :order_quantity
    	t.integer :order_price
    	t.string  :order_product_image_id
    	t.string  :order_name
      t.timestamps
    end
  end
end
