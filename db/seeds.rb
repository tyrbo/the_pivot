Category.create(name: "Medicine")
Category.create(name: "Food")
Category.create(name: "Supplies")
Category.create(name: "Transportation")
Category.create(name: "Clothing")

User.create(full_name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password", role: :user, display_name: nil)
User.create(full_name: "Jeff Casimir", email: "demo+jeff@jumpstartlab.com", password: "password", role: :user, display_name: "j3")
User.create(full_name: "Jorge Tellez", email: "demo+jorge@jumpstartlab.com", password: "password", role: :user, display_name: "novohispano")
josh = User.create(full_name: "Josh Cheek", email: "demojosh@jumpstartlab.com", password: "password", password_confirmation: "password", display_name: "Programmer Relief Foundation", role: :supplier)
tan = User.create(full_name: "Tan Doan", email: "tandoan@example.com", password: "password", password_confirmation: "password", display_name: "Viet Cong Rescue Crew", role: :supplier)

kids = Supplier.create(name: 'Help the Kids', url: 'savethechildren', description: 'One kid at a time')
tsunami = Supplier.create(name: 'Tsunami Relief', url: "tsunami-relief", description: 'Preventing wipe outs')
wildfire = Supplier.create(name: 'Wildfire Recovery Team', url: 'wildfire-relief', description: 'Rebuilding the ashes')

SuppliersUser.create(supplier_id: kids.id, user_id: josh.id)
SuppliersUser.create(supplier_id: tsunami.id, user_id: tan.id)

kids.items.create(title: "Bandage", description: "Waterproof Standard Size",
 inventory: 10000000, price: 12.99, size: '400', category_ids: [1])
kids.items.create(title: "Ibuprofin", description: "200ml, 200 per bottle",
 inventory:12000000, price: 17.99, size: '200', category_ids:[1])
kids.items.create(title: "Gauze", description: "Cloth",
 inventory:3000000, price: 23.99, size: '200', category_ids:[1])
kids.items.create(title: "Neosporin", description: "Fix your cuts",
 inventory:5000000, price: 23.99, size: '200', category_ids:[1])
kids.items.create(title: "Antacids", description: "Fix your stomach",
 inventory: 4000000, price: 29.99, size: '200', category_ids: [1])
kids.items.create(title: "Water Bottles", description: "32 pack",
 inventory: 5000000, price: 35.99, size: '200', category_ids:[2])
kids.items.create(title: "Soup", description: "10pac asorted types",
 inventory: 10000000, price: 33.99, size: '200', category_ids: [2])
kids.items.create(title: "Rice", description: "50 lb bag",
 inventory: 10000000, price: 33.99, size: '200', category_ids:[2])
kids.items.create(title: "Protien Bars", description: "30 boxes",
 inventory: 12000000, price: 31.15, size: '200', category_ids:[2])
kids.items.create(title: "Apples", description: "Red",
 inventory: 12000000, price: 36.99, size: '200', category_ids:[2])
kids.items.create(title: "Rope", description: "Tie to things",
 inventory: 15000000, price: 30.99, size: '200', category_ids: [3])
kids.items.create(title: "Blankets", description: "Keeps warms",
 inventory: 15000000, price: 30.99, size: '200', category_ids:[3])
tsunami.items.create(title: "Tents", description: "Easy to set up",
 inventory: 5000000, price: 30.99, size: '200', category_ids:[3])
tsunami.items.create(title: "Sleeping Bag", description: "Adult sized",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[3])
tsunami.items.create(title: "Cot", description: "Twin Sized Sleeping Cot",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[3])
tsunami.items.create(title: "Van Rental", description: "8 person van per day",
 inventory: 15, price: 30.99, size: '200', category_ids: [4])
tsunami.items.create(title: "Truck Rental", description: "Standard sized pickup truck per day",
 inventory: 15, price: 30.99, size: '200', category_ids:[4])
tsunami.items.create(title: "Helicopter Pickup", description: "One location",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[4])
tsunami.items.create(title: "Pants", description: "All sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
tsunami.items.create(title: "Sweaters", description: "All Sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
tsunami.items.create(title: "T-Shirts", description: "All Sizes",
 inventory: 15, price: 30.99, size: '200', category_ids: [5])
tsunami.items.create(title: "Jackets", description: "All Sizes",
 inventory: 15, price: 30.99, size: '200', category_ids:[5])
tsunami.items.create(title: "Socks", description: "Wool, all sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
tsunami.items.create(title: "Shoes", description: "Sneakers, all sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
tsunami.items.create(title: "Undergarments", description: "All types & sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])

wildfire.items.create(title: "Water", description: "bottled drinking water",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[3])
wildfire.items.create(title: "Van Rental", description: "8 person van per day",
 inventory: 15, price: 30.99, size: '200', category_ids: [4])
wildfire.items.create(title: "Truck Rental", description: "Standard sized pickup truck per day",
 inventory: 15, price: 30.99, size: '200', category_ids:[4])
wildfire.items.create(title: "Helicopter Pickup", description: "One location",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[4])
wildfire.items.create(title: "Pants", description: "All sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
wildfire.items.create(title: "Sweaters", description: "All Sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
wildfire.items.create(title: "T-Shirts", description: "All Sizes",
 inventory: 15, price: 30.99, size: '200', category_ids: [5])
wildfire.items.create(title: "Jackets", description: "All Sizes",
 inventory: 15, price: 30.99, size: '200', category_ids:[5])
wildfire.items.create(title: "Socks", description: "Wool, all sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
wildfire.items.create(title: "Shoes", description: "Sneakers, all sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
wildfire.items.create(title: "Undergarments", description: "All types & sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])


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

Address.create(city: 'Denver', state: 'CO', zip: '80205', street: '1510 Blake St', shipping: true )
Address.create(city: 'Seattle', state: 'WA', zip: '13205', street: '11233 Ralph St', shipping: true )
Address.create(city: 'Chicago', state: 'IL', zip: '80235', street: '1143 Park St', shipping: true )
Address.create(city: 'San Francisco', state: 'CA', zip: '52205', street: '432 Boardwalk St', shipping: true )
Address.create(city: 'New York', state: 'NY', zip: '13505', street: '2313 Pine St', shipping: true )
Address.create(city: 'Dallas', state: 'TX', zip: '63205', street: '543 Plains St', shipping: true )
Address.create(city: 'Miami', state: 'FL', zip: '88305', street: '93 Ocean St', shipping: true )
Address.create(city: 'Atlanta', state: 'GA', zip: '10905', street: '323 Peach St', shipping: true )
Address.create(city: 'Los Angeles', state: 'CA', zip: '24205', street: '233 Palm St', billing: true )
Address.create(city: 'Philadelphia', state: 'PA', zip: '45305', street: '9239 Allen St', billing: true )
Address.create(city: 'Nashville', state: 'TN', zip: '10305', street: '452 Main St', billing: true )
Address.create(city: 'Houston', state: 'TX', zip: '32305', street: '422 York St', billing: true )
Address.create(city: 'Salt Lake City', state: 'UT', zip: '90905', street: '2322 Lake St', billing: true )
Address.create(city: 'St. Louis', state: 'MO', zip: '24305', street: '3213 Broad St', billing: true )
Address.create(city: 'Cleveland', state: 'OH', zip: '23405', street: '9898 James St', billing: true )
Address.create(city: 'Detroit', state: 'MI', zip: '13305', street: '7876 Motor St', billing: true )
Address.create(city: 'Portland', state: 'OR', zip: '52205', street: '7653 Green St', billing: true )

UserAddress.create(user_id: 1, address_id: 1)
UserAddress.create(user_id: 1, address_id: 9)
UserAddress.create(user_id: 2, address_id: 2)
UserAddress.create(user_id: 2, address_id: 10)
UserAddress.create(user_id: 3, address_id: 3)
UserAddress.create(user_id: 3, address_id: 11)
UserAddress.create(user_id: 4, address_id: 4)
UserAddress.create(user_id: 4, address_id: 12)
UserAddress.create(user_id: 5, address_id: 5)
UserAddress.create(user_id: 5, address_id: 13)
UserAddress.create(user_id: 1, address_id: 6)
UserAddress.create(user_id: 1, address_id: 14)
UserAddress.create(user_id: 2, address_id: 7)
UserAddress.create(user_id: 2, address_id: 15)
UserAddress.create(user_id: 3, address_id: 8)
UserAddress.create(user_id: 3, address_id: 16)
UserAddress.create(user_id: 4, address_id: 17)



"======= Shit has been seeded ========"
