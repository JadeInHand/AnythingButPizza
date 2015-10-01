### Project 2 - Anything But Pizza (ABP)

# _ABP helps to bring the community together by providing people home cooked food._ 

-[view](https://github.com/JadeInHand/AnythingButPizza) source in github
-[view](https://afternoon-basin-3766.herokuapp.com/) source in Heroku

---------------------------

## **Models**
- category, item, line_item, shopping_cart, user, stripe

## **Associactions**
- Users: has many items, has many shopping carts
- Items: has many line items, belongs to user, belongs to category
- Line Item: belongs to shopping cart, belongs to item
- Category: has many items
- Shopping cart: has many line items, belongs to user

## **Extra Gems**
- gem 'bcrypt', '~> 3.1.7'
- gem 'pry-rails'
- gem 'cloudinary'
- gem 'stripe'
- gem 'gon'
- gem 'geocoder'
- gem 'dotenv-rails'
- gem 'rails_12factor', (group: production)

## **Javascript**

- application.js: used for toggling the icons in the navbar and clearing out the picked up items
- categories.js: used for adding new categories to the database on the create new item page
- places.js: used to implement the google maps api

## **Stylesheet**
- .svg format used for icons
- css has been split across in separate files in the stylesheet folder

-------------------------------

## **ABP Main functionalities**
- Users have the option to be both a _cook (seller)_, and a _buyer_.

# **User: cook**
- Can create food items which have a minimum cost and serving size as 1 and has to have a valid address
- Cook is able to view his/her current and past yums
- Cook is able to view who is on the way to pickup food from his/her address

# **User: buyer**
- Has to have a valid postcode while signing up
- Food available in the buyer's postcode is displayed to him/her by default
- Buyer can search for food items outside his/her postcode
- Buyers can view their past orders in thier profile page
- Buyer can buy food from cooks staying in different areas (postcodes). After making payment, the pickup spots are displayed via a google map

# **Shopping Carts**
- Allow users to purchase food items from different cooks
- A user cannot buy food from him/her self
- When a user adds food items to the cart, the quantity remaining in the items page is updated accordingly, but it is deducted from the database, only when the payment has been made
- A shopping card if idle for more than 20 minutes, is destroyed
- If a user creates a shopping cart but logs out without paying, the shopping card is destroyed

# **Payments**
- The Payments feature has been implemented using the Stripe api
- The default Credit card number is : 4242 4242 4242 4242
- User needs to provide a valid expiration date and a 3 digit cvc number
