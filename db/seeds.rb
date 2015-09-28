Category.destroy_all
cat1 = Category.create :types => "Turkish"
cat2 = Category.create :types => "Baked Goods"


Item.destroy_all
itm1 = Item.create :name => "Banana Bread", :servings => 10, :cost => 5.00, :description => "Super Tasty Yummy B Bread", :tags => "Tasty, Homecooked, Made with love.", :active => true
itm2 = Item.create :name => "Baklava", :servings => 8, :cost => 1.00, :description => "Kas's Tasty Baklava", :tags => "Moist, Homecooked, Made with love.", :active => true
itm3 = Item.create :name => "Spaghetti", :servings => 3, :cost => 7.00, :description => "Grandma's Special Recipe", :tags => "Tomatoey, Italian, Generation old recipe.", :active => true



ShoppingCart.destroy_all
sc1 = ShoppingCart.create :order_number => 1
sc1 = ShoppingCart.create :order_number => 2
sc1 = ShoppingCart.create :order_number => 3

LineItem.destroy_all
li1 = LineItem.create :quantity_purchased => 3
li2 = LineItem.create :quantity_purchased => 2
li3 = LineItem.create :quantity_purchased => 1
li4 = LineItem.create :quantity_purchased => 2
li5 = LineItem.create :quantity_purchased => 2

