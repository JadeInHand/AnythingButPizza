class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :item_id
      t.integer :shopping_cart_id
      t.integer :quantity_purchased
      t.integer :cost

      t.timestamps null: false
    end
  end
end
