class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
    	t.integer :product_id
    	t.string  :disc_name, null: false
    	t.integer :disc_number, null: false
      t.timestamps
    end
  end
end
