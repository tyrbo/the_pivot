Category.create(name: "Medicine")
Category.create(name: "Food")
Category.create(name: "Supplies")
Category.create(name: "Transportation")
Category.create(name: "Clothing")

User.create(full_name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password", role: :user, display_name: nil)
User.create(full_name: "Jeff", email: "demo+jeff@jumpstartlab.com", password: "password", role: :user, display_name: "j3")
User.create(full_name: "Jorge Tellez", email: "demo+jorge@jumpstartlab.com", password: "password", role: :user, display_name: "novohispano")
@josh = User.create(full_name: "Josh Cheek", email: "demojosh@jumpstartlab.com", password: "password", password_confirmation: "password", display_name: "Programmer Relief Foundation", role: :supplier)
@tan = User.create(full_name: "Tan Doan", email: "tandoan@example.com", password: "password", password_confirmation: "password", display_name: "Viet Cong Rescue Crew", role: :supplier)


Item.create(title: "Bandage", description: "Waterproof Standard Size",
 inventory: 10, price_pie: 12.99, category_ids: [1])
@josh.items.create(title: "Ibprofin", description: "200ml, 200 per bottle",
 inventory:12, price_pie: 17.99, category_ids:[1])
@josh.items.create(title: "Gauze", description: "Cloth",
 inventory:3, price_pie: 23.99, category_ids:[1])
@josh.items.create(title: "Neosporin", description: "Fix your cuts",
 inventory:5, price_pie: 23.99, category_ids:[1])
@josh.items.create(title: "Antacids", description: "Fix your stomach",
 inventory: 4, price_pie: 29.99, category_ids: [1])
@josh.items.create(title: "Water Bottles", description: "32 pack",
 inventory: 5, price_pie: 35.99, category_ids:[2])
@josh.items.create(title: "Soup", description: "10 pack assorted types",
 inventory: 10, price_pie: 33.99, category_ids: [2])
@josh.items.create(title: "Rice", description: "50 lb bag",
 inventory: 10, price_pie: 33.99, category_ids:[2])
@josh.items.create(title: "Protien Bars", description: "30 boxes",
 inventory: 12, price_pie: 31.15, category_ids:[2])
@josh.items.create(title: "Apples", description: "Red",
 inventory: 12, price_pie: 36.99, category_ids:[2])
@josh.items.create(title: "Rope", description: "Tie to things",
 inventory: 15, price_pie: 30.99, category_ids: [3])
@josh.items.create(title: "Blankets", description: "Keeps warms",
 inventory: 15, price_pie: 30.99, category_ids:[3])
@tan.items.create(title: "Tents", description: "Easy to set up",
 inventory: 5, price_pie: 30.99, category_ids:[3])
@tan.items.create(title: "Sleeping Bag", description: "Adult sized",
 inventory: 12, price_pie: 30.99, category_ids:[3])
@tan.items.create(title: "Cot", description: "Twin Sized Sleeping Cot",
 inventory: 12, price_pie: 30.99, category_ids:[3])
@tan.items.create(title: "Van Rental", description: "8 person van per day",
 inventory: 15, price_pie: 30.99, category_ids: [4])
@tan.items.create(title: "Truck Rental", description: "Standard sized pickup truck per day",
 inventory: 15, price_pie: 30.99, category_ids:[4])
@tan.items.create(title: "Helicopter Pickup", description: "One location",
 inventory: 12, price_pie: 30.99, category_ids:[4])
@tan.items.create(title: "Pants", description: "All sizes",
 inventory: 12, price_pie: 30.99, category_ids:[5])
@tan.items.create(title: "Sweaters", description: "All Sizes",
 inventory: 12, price_pie: 30.99, category_ids:[5])
@tan.items.create(title: "T-Shirts", description: "All Sizes",
 inventory: 15, price_pie: 30.99, category_ids: [5])
@tan.items.create(title: "Jackets", description: "All Sizes",
 inventory: 15, price_pie: 30.99, category_ids:[5])
@tan.items.create(title: "Socks", description: "Wool, all sizes",
 inventory: 12, price_pie: 30.99, category_ids:[5])
@tan.items.create(title: "Shoes", description: "Sneakers, all sizes",
 inventory: 12, price_pie: 30.99, category_ids:[5])
@tan.items.create(title: "Undergarments", description: "All types & sizes",
 inventory: 12, price_pie: 30.99, category_ids:[5])

Order.create(user_id: 1, order_total: 15, order_type: "pick-up", delivery_address: nil, order_status: "completed")
Order.create(user_id: 1, order_total: 16, order_type: "delivery", delivery_address: "1520 Blake Street, Denver, CO", order_status: "cancelled")
Order.create(user_id: 2, order_total: 17, order_type: "pick-up", delivery_address: nil, order_status: "ordered")
Order.create(user_id: 3, order_total: 35, order_type: "pick-up", delivery_address: nil, order_status: "ordered")
Order.create(user_id: 4, order_total: 45, order_type: "pick-up", delivery_address: nil, order_status: "cancelled")
Order.create(user_id: 4, order_total: 34, order_type: "delivery", delivery_address: "1510 Blake Street, Denver, CO", order_status: "completed")
Order.create(user_id: 3, order_total: 78, order_type: "pick-up", delivery_address: nil, order_status: "completed")
Order.create(user_id: 2, order_total: 88, order_type: "pick-up", delivery_address: nil, order_status: "completed")
Order.create(user_id: 4, order_total: 34, order_type: "pick-up", delivery_address: nil, order_status: "completed")
Order.create(user_id: 3, order_total: 12, order_type: "pick-up", delivery_address: nil, order_status: "completed")

OrderItem.create(order_id: 1, item_id: 2)
OrderItem.create(order_id: 2, item_id: 4)
OrderItem.create(order_id: 3, item_id: 5)
OrderItem.create(order_id: 4, item_id: 6)
OrderItem.create(order_id: 5, item_id: 7)
OrderItem.create(order_id: 6, item_id: 8)
OrderItem.create(order_id: 7, item_id: 9)
OrderItem.create(order_id: 8, item_id: 10)
OrderItem.create(order_id: 9, item_id: 11)
OrderItem.create(order_id: 10, item_id: 12)



"======= Shit has been seeded ========"
