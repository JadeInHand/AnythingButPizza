class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :address
      t.float :latitude
      t.float :longitude
      t.string :postcode
      t.text :image

      t.timestamps null: false
    end
  end
end
