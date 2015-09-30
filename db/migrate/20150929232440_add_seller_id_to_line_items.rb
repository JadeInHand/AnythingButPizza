class AddSellerIdToLineItems < ActiveRecord::Migration
  def change
  	add_column :line_items, :seller_id, :integer
  end
end
