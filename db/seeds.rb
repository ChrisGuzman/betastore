hat = Product.create!(name: "Hat", price: 5, image_url: "/images/products/hat.jpg", )
hoodie = Product.create!(name: "Hoodie", price: 15, image_url: "/images/products/hoodie.jpg")
iphone_case = Product.create!(name: "iPhone Case", price: 3, image_url: "/images/products/iphone_case.jpg")
journal = Product.create!(name: "Journal", price: 7, image_url: "/images/products/journal.jpg")
shirt = Product.create!(name: "Shirt", price: 8, image_url: "/images/products/shirt.jpg")
sticker = Product.create!(name: "Sticker", price: 1, image_url: "/images/products/sticker.jpg")

clothing = Category.create!(name: "Clothing")
electronics = Category.create!(name: "Electronics")
office_supplies = Category.create!(name: "Office Supplies")

# This is wrong because I am creating a method
# iphone_case.categories= and initializing as electronics
iphone_case.categories << electronics
iphone_case.categories << office_supplies
hat.categories << clothing
hoodie.categories << clothing
shirt.categories << clothing
journal.categories << office_supplies
sticker.categories << office_supplies

User.create!(email: 'chris@example.com', password: 'secret')

# chris = Customer.create!(name:"Chris", email:"chris@example.com")
# paul = Customer.create!(name: "Paul", email: "Paul@betamore.com")
# paul.credit_cards.create(card_number:"4111111111111", expires_on:"2017-04-01")

# CreditCard.create!(
#   customer: chris,
#   card_number:"5222222222222222",
#   expiry:"02/22")


