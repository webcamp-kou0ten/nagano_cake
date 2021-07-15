class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps

      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :shipping_cost, null: false, default: 800
      t.integer :payment_method, null: false, default: 0
      t.integer :price, null: false
      t.integer :order_status, null: false, default: 0
    end
  end
end
