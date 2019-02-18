class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer  :genre,default: 0, null: false, limit: 1
      t.string   :product_name#, null: false
      t.integer  :price#, null: false
      t.string   :artist_name#, null: false
      t.string   :product_image_id
      t.string   :company#, null: false
      t.integer  :stock_quantity#, null: false
      t.boolean  :deleted, null: false, default: false
      t.integer  :admin_status, default: false
      t.timestamps
    end
  end
end
