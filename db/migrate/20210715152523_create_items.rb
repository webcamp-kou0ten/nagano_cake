class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.timestamps

      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.string :image_id, null: false
      t.boolean :sell_status, null: false, default: false
    end
  end
end
