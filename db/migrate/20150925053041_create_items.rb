class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :name
      t.integer :servings
      t.float :cost
      t.text :description
      t.text :tags
      t.text :image
      t.boolean :active
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
