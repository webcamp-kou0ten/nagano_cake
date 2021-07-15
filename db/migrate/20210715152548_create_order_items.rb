class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

      t.timestamps

      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :amount, null: false, default: 0
      t.integer :total_price, null: false
      t.integer :production_status, null: false, default: 0
    end
  end
end
