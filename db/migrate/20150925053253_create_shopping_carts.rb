class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.integer :total_cost
      t.integer :order_number
      t.integer :user_id
      t.boolean :active

      t.timestamps null: false
    end
  end
end
