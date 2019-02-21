class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
    	t.integer :user_id
    	t.string  :shipping_address
    	t.string  :shipping_postcode
    	t.string  :shipping_name
      t.timestamps
    end
  end
end
