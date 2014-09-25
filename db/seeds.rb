Category.create(name: "Medicine")
Category.create(name: "Food")
Category.create(name: "Survival")
Category.create(name: "Rope, Tarps, Tiedowns")
Category.create(name: "Clothing")
Category.create(name: "Batteries & Power")
Category.create(name: "Cleaning")
Category.create(name: "Safety")
Category.create(name: "Power Equipment")
Category.create(name: "Hurricane")
Category.create(name: "Fire")


User.create(full_name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password", role: :admin, display_name: nil)
User.create(full_name: "Jeff Casimir", email: "demo+jeff@jumpstartlab.com", password: "password", role: :user, display_name: "j3")
User.create(full_name: "Jorge Tellez", email: "demo+jorge@jumpstartlab.com", password: "password", role: :admin, display_name: "novohispano")
josh = User.create(full_name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", password: "password", password_confirmation: "password", display_name: "Josh", role: 'supplier')
tan =  User.create(full_name: "Tan Doan", email: "tandoan@example.com", password: "password", password_confirmation: "password", display_name: "Tan", role: 'supplier')
first_suppliers = 1
10.times do
  user = User.create(full_name: Faker::Name.name,
                         email: Faker::Internet.email,
                      password: "password",
         password_confirmation: "password",
                          role: "supplier",
                  display_name: Faker::Name.first_name)

  SuppliersUser.create(supplier_id: first_suppliers, user_id: user.id)
  first_suppliers += 1
end

second_suppliers = 1
10.times do
  user = User.create(full_name: Faker::Name.name,
                         email: Faker::Internet.email,
                      password: "password",
         password_confirmation: "password",
                          role: "supplier",
                  display_name: Faker::Name.first_name)

  SuppliersUser.create(supplier_id: second_suppliers, user_id: user.id)
  second_suppliers += 1
end

kids_picture = File.new("#{Rails.root}/app/assets/images/help_the_kids.jpg")
wildfire_picture = File.new("#{Rails.root}/app/assets/images/wildfire.jpg")
tsunami_picture = File.new("#{Rails.root}/app/assets/images/tsunami.jpg")
bandages = File.new("#{Rails.root}/app/assets/images/Bandages.jpg")
gauze = File.new("#{Rails.root}/app/assets/images/gauze.jpg")
ibuprofen = File.new("#{Rails.root}/app/assets/images/ibuprofen.jpg")
tent = File.new("#{Rails.root}/app/assets/images/tent.jpg")
sleepingbag = File.new("#{Rails.root}/app/assets/images/sleepingbag.jpg")
cot = File.new("#{Rails.root}/app/assets/images/cot.jpg")
water = File.new("#{Rails.root}/app/assets/images/water.jpg")
van = File.new("#{Rails.root}/app/assets/images/van.jpg")
truck = File.new("#{Rails.root}/app/assets/images/truck.jpg")
hunger_picture = File.new("#{Rails.root}/app/assets/images/hunger_relief.jpg")
medical_picture = File.new("#{Rails.root}/app/assets/images/medical_supply.png")
medic_picture = File.new("#{Rails.root}/app/assets/images/medic.jpeg")
safe_picture = File.new("#{Rails.root}/app/assets/images/safe.jpeg")
hurricane_picture = File.new("#{Rails.root}/app/assets/images/hurricane.jpg")
relief_picture = File.new("#{Rails.root}/app/assets/images/relief.jpeg")
disaster_picture = File.new("#{Rails.root}/app/assets/images/disaster.jpeg")

kids = Supplier.create(name: 'Help the Kids', url: 'savethechildren', description: 'One kid at a time. One kid at a time. One kid at a time. One kid at a time. One kid at a time.', enabled: true, picture: kids_picture)
tsunami = Supplier.create(name: 'Tsunami Relief', url: "tsunami-relief", description: 'Preventing wipe outs. Preventing wipe outs. Preventing wipe outs. Preventing wipe outs. Preventing wipe outs.', enabled: true, picture: tsunami_picture)
wildfire = Supplier.create(name: 'Wildfire Recovery Team', url: 'wildfire-relief', description: 'Rebuilding the ashes. Rebuilding the ashes. Rebuilding the ashes. Rebuilding the ashes. Rebuilding the ashes.', enabled: true, picture: wildfire_picture)
hunger = Supplier.create(name: 'HungerRelief', url: 'hungerrelief', description: 'Feeding the hungry. Feeding the hungry. Feeding the hungry. Feeding the hungry. Feeding the hungry.', enabled: true, picture: hunger_picture)
medical = Supplier.create(name: 'Medical Supply Fund', url: 'medical-supply-fund', description: 'Medical Fund for relief. Medical Fund for relief. Medical Fund for relief. Medical Fund for relief. Medical Fund for relief.', enabled: true, picture: medical_picture)
medic = Supplier.create(name: 'MedicSupply', url: 'medicsupply', description: 'Medical Supplies for the masses. Medical Supplies for the masses. Medical Supplies for the masses. Medical Supplies for the masses. ', enabled: true, picture: medic_picture)
safe = Supplier.create(name: 'SafeStart', url: 'safestart', description: 'Ensuring every child is cared for. Ensuring every child is cared for. Ensuring every child is cared for. Ensuring every child is cared for.', enabled: true, picture: safe_picture)
hurricane = Supplier.create(name: 'Hurricane Recovery', url: 'hurricanerecovery', description: 'Recovery from the unexpected. Recovery from the unexpected. Recovery from the unexpected. Recovery from the unexpected. ', enabled: true, picture: hurricane_picture)
relief = Supplier.create(name: 'Relief Without Borders', url: 'relief-without-borders', description: 'Relieve the World. Relieve the World. Relieve the World. Relieve the World.', enabled: true, picture: relief_picture)
disaster = Supplier.create(name: 'Disaster Relief', url: 'disaster-relief', description: 'Disaster Relief for Everyone. Disaster Relief for Everyone. Disaster Relief for Everyone. Disaster Relief for Everyone.', enabled: true, picture: disaster_picture)

SuppliersUser.create(supplier_id: kids.id, user_id: josh.id)
SuppliersUser.create(supplier_id: tsunami.id, user_id: tan.id)

kids.items.create(title: "Bandages", description: "Waterproof Standard Size",
 inventory: 10000000, price: 12.99, size: '100pk, 100/pk', category_ids: [1, 3, 8], picture: bandages)
kids.items.create(title: "Ibuprofen", description: "200ml, 200 per bottle",
 inventory:12000000, price: 17.99, size: '50pk', category_ids:[1, 3, 8], picture: ibuprofen)
kids.items.create(title: "Gauze", description: "Cloth, 10ft rolls",
 inventory:3000000, price: 50.99, size: '200pk', category_ids:[1, 8], picture: gauze)
kids.items.create(title: "Neosporin", description: "Fixes cuts",
 inventory:5000000, price: 23.99, size: '5pk, 16oz/pk', category_ids:[1, 3, 8])
kids.items.create(title: "Antacids", description: "200ml, 200 per bottle",
 inventory: 4000000, price: 29.99, size: '200pk', category_ids: [1, 3, 8])
kids.items.create(title: "Water Bottles", description: "Fresh Water in individual bottles",
 inventory: 5000000, price: 35.99, size: '32pk', category_ids:[2, 3])
kids.items.create(title: "Chicken Noodle Soup", description: "Generic Chicken Soup",
 inventory: 10000000, price: 33.99, size: '10pk, 16oz cans', category_ids: [2, 3])
kids.items.create(title: "White Rice", description: "White rice, burlap sack",
 inventory: 10000000, price: 33.99, size: '50 lbs', category_ids:[2, 3])
kids.items.create(title: "Protien Bars", description: "Chocolate & Peanutbutter Varieties",
 inventory: 12000000, price: 31.15, size: '30pk, 12 bars/pk', category_ids:[2, 3])
kids.items.create(title: "Apples", description: "Red & Green",
 inventory: 12000000, price: 36.99, size: '50 lbs', category_ids:[2, 3])
kids.items.create(title: "Rope", description: "Tie to things",
 inventory: 15000000, price: 30.99, size: '50ft', category_ids: [3, 4])
kids.items.create(title: "Blankets", description: "Keeps warms, 5x5",
 inventory: 15000000, price: 30.99, size: '5pk', category_ids:[3, 5])
kids.items.create(title: "Brown Rice", description: "Brown Rice, burlap sack",
  inventory: 4000000, price: 16.99, size: '50lb', category_ids: [2, 3])
kids.items.create(title: "Black Beans", description: "Generic Black Beans",
  inventory: 5000000, price: 35.99, size: '32pk, 16ox', category_ids:[2, 3 ])
kids.items.create(title: "Kids T Shirts", description: "Varied colors, mix of XS-XXL",
  inventory: 10000000, price: 33.99, size: '50pk', category_ids: [3, 5])
kids.items.create(title: "Kids Jackets", description: "Light coats, varied colors, mix of XS-XXL",
  inventory: 10000000, price: 33.99, size: '50pk', category_ids:[3, 5])
kids.items.create(title: "Family Tents", description: "Easily assembled, fits 10x10",
  inventory: 12000000, price: 31.15, size: '10pk', category_ids:[3, 4, 8])
kids.items.create(title: "Tarp", description: "10x10",
  inventory: 12000000, price: 36.99, size: '20pk', category_ids:[3, 4])
kids.items.create(title: "Gallon Water", description: "Fresh water in gallon sized containers",
  inventory: 15000000, price: 30.99, size: '32pk', category_ids: [2, 3])
kids.items.create(title: "Kids Socks", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])
kids.items.create(title: "Kids Socks3", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])

tsunami.items.create(title: "Tents", description: "Easy to set up, 8x8",
 inventory: 5000000, price: 30.99, size: '1', category_ids:[3, 4], picture: tent)
tsunami.items.create(title: "Sleeping Bag", description: "Adult sized",
 inventory: 12000000, price: 30.99, size: '1', category_ids:[3], picture: sleepingbag)
tsunami.items.create(title: "Cot", description: "Twin Sized Sleeping Cot",
 inventory: 12000000, price: 30.99, size: '1', category_ids:[3], picture: cot)
tsunami.items.create(title: "WetVac", description: "32hz",
 inventory: 15, price: 200.00, size: '1', category_ids: [7, 9])
tsunami.items.create(title: "Mops", description: "Super absorbant",
 inventory: 15, price: 30.99, size: '4pk', category_ids:[7, 10])
tsunami.items.create(title: "Power Cord", description: "15ft, US",
 inventory: 12000000, price: 30.99, size: '3pk', category_ids:[6, 8])
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
tsunami.items.create(title: "Shoes9", description: "Sneakers, all sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
tsunami.items.create(title: "Undergarments", description: "All types & sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
tsunami.items.create(title: "Generator", description: "Outputs 100v",
 inventory: 12000000, price: 300.00, size: '1', category_ids:[3, 6])
tsunami.items.create(title: "Brooms", description: "Standard Brooms",
 inventory: 12000000, price: 30.99, size: '3pk', category_ids:[7])
tsunami.items.create(title: "Soap", description: "Generic bars",
 inventory: 15, price: 30.99, size: '20pk', category_ids: [7,8])
tsunami.items.create(title: "Detergent", description: "Generic detergent",
 inventory: 15, price: 30.99, size: '4pk, 32oz', category_ids:[7])
tsunami.items.create(title: "Sponges", description: "Standard kitchen sponge",
 inventory: 12000000, price: 30.99, size: '20pk', category_ids:[7])
tsunami.items.create(title: "WoodChip Clipper", description: "Small, low power",
 inventory: 12000000, price: 200.00, size: '200', category_ids:[3])
tsunami.items.create(title: "Face Masks", description: "All types & sizes",
  inventory: 12000000, price: 30.99, size: '100pk', category_ids:[1, 3, 8])
tsunami.items.create(title: "Kids Socks4", description: "Cotton/polyester blend, sizes range 1-9",
 inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])

wildfire.items.create(title: "Water", description: "bottled drinking water",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[3], picture: water)
wildfire.items.create(title: "Van Rental", description: "8 person van per day",
 inventory: 15, price: 100.99, size: '1 day', category_ids: [4], picture: van)
wildfire.items.create(title: "Truck Rental", description: "Standard sized pickup truck per day",
 inventory: 15, price: 200.99, size: '1 day', category_ids:[4], picture: truck)
wildfire.items.create(title: "Helicopter Pickup", description: "One location",
 inventory: 12000000, price: 600.99, size: '1 day', category_ids:[4, 11])
wildfire.items.create(title: "Hats", description: "One Size, Varied Colors",
 inventory: 12000000, price: 30.99, size: '5pk', category_ids:[5,11])
wildfire.items.create(title: "Work Boots", description: "Specify Size",
 inventory: 12000000, price: 30.99, size: '1', category_ids:[5])
wildfire.items.create(title: "Long Sleeved Shirts", description: "Varied Colors, Sizes XS-XL",
 inventory: 15, price: 30.99, size: '10pk', category_ids: [5])
wildfire.items.create(title: "Winter Coats", description: "One Size",
 inventory: 15, price: 30.99, size: '1', category_ids:[5])
wildfire.items.create(title: "Wool Socks", description: "Wool, all sizes",
 inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5,11])
wildfire.items.create(title: "Rain Coat", description: "One Size",
 inventory: 12000000, price: 30.99, size: '2pk', category_ids:[5])
wildfire.items.create(title: "Rain Boots", description: "Specify Size",
 inventory: 12000000, price: 30.99, size: '1', category_ids:[5])
wildfire.items.create(title: "Power Cord", description: "15ft, US",
 inventory: 12000000, price: 30.99, size: '3pk', category_ids:[6, 8])
wildfire.items.create(title: "Pants12", description: "Sizes XS-XXL",
 inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5, 11])
wildfire.items.create(title: "Sweaters12", description: "Sizes XS-XXL",
 inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5])
wildfire.items.create(title: "T-Shirts12", description: "Sizes XS-XXL",
 inventory: 15, price: 30.99, size: '50pk', category_ids: [5])
wildfire.items.create(title: "Jackets12", description: "Size L",
 inventory: 15, price: 30.99, size: '2pk', category_ids:[5])
wildfire.items.create(title: "Socks12", description: "Cotton, all sizes",
 inventory: 12000000, price: 30.99, size: '30pk', category_ids:[5])
wildfire.items.create(title: "Shoes12", description: "Sneakers, sizes 5-9",
 inventory: 12000000, price: 30.99, size: '5pk', category_ids:[5, 11])
wildfire.items.create(title: "Undergarments12", description: "All types & sizes",
 inventory: 12000000, price: 30.99, size: '50pk', category_ids:[5])
wildfire.items.create(title: "Generator12", description: "Outputs 100v",
 inventory: 12000000, price: 300.00, size: '1', category_ids:[3, 6, 11])
wildfire.items.create(title: "Kids Socks5", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])

hunger.items.create(title: "Bandage1", description: "Waterproof Standard Size",
  inventory: 10000000, price: 12.99, size: '100pk, 100/pk', category_ids: [1, 3, 8])
hunger.items.create(title: "Ibuprofin1", description: "200ml, 200 per bottle",
  inventory:12000000, price: 17.99, size: '50pk', category_ids:[1, 3, 8])
hunger.items.create(title: "Gauze1", description: "Cloth, 10ft rolls",
  inventory:3000000, price: 50.99, size: '200pk', category_ids:[1, 8])
hunger.items.create(title: "Neosporin1", description: "Fixes cuts",
  inventory:5000000, price: 23.99, size: '5pk, 16oz/pk', category_ids:[1, 3, 8])
hunger.items.create(title: "Antacids1", description: "200ml, 200 per bottle",
  inventory: 4000000, price: 29.99, size: '200pk', category_ids: [1, 3, 8])
hunger.items.create(title: "Water Bottles1", description: "Fresh Water in individual bottles",
  inventory: 5000000, price: 35.99, size: '32pk', category_ids:[2, 3])
hunger.items.create(title: "Chicken Noodle Soup1", description: "Generic Chicken Soup",
  inventory: 10000000, price: 33.99, size: '10pk, 16oz cans', category_ids: [2, 3])
hunger.items.create(title: "White Rice1", description: "White rice, burlap sack",
  inventory: 10000000, price: 33.99, size: '50 lbs', category_ids:[2, 3])
hunger.items.create(title: "Protien Bars1", description: "Chocolate & Peanutbutter Varieties",
  inventory: 12000000, price: 31.15, size: '30pk, 12 bars/pk', category_ids:[2, 3])
hunger.items.create(title: "Apples1", description: "Red & Green",
  inventory: 12000000, price: 36.99, size: '50 lbs', category_ids:[2, 3])
hunger.items.create(title: "Rope1", description: "Tie to things",
  inventory: 15000000, price: 30.99, size: '50ft', category_ids: [3, 4])
hunger.items.create(title: "Blankets1", description: "Keeps warms, 5x5",
  inventory: 15000000, price: 30.99, size: '5pk', category_ids:[3, 5])
hunger.items.create(title: "Brown Rice1", description: "Brown Rice, burlap sack",
   inventory: 4000000, price: 16.99, size: '50lb', category_ids: [2, 3])
hunger.items.create(title: "Black Beans1", description: "Generic Black Beans",
   inventory: 5000000, price: 35.99, size: '32pk, 16ox', category_ids:[2, 3 ])
hunger.items.create(title: "Kids T Shirts1", description: "Varied colors, mix of XS-XXL",
   inventory: 10000000, price: 33.99, size: '50pk', category_ids: [3, 5])
hunger.items.create(title: "Kids Jackets1", description: "Light coats, varied colors, mix of XS-XXL",
   inventory: 10000000, price: 33.99, size: '50pk', category_ids:[3, 5])
hunger.items.create(title: "Family Tents1", description: "Easily assembled, fits 10x10",
   inventory: 12000000, price: 31.15, size: '10pk', category_ids:[3, 4, 8])
hunger.items.create(title: "Tarp1", description: "10x10",
   inventory: 12000000, price: 36.99, size: '20pk', category_ids:[3, 4])
hunger.items.create(title: "Gallon Water1", description: "Fresh water in gallon sized containers",
   inventory: 15000000, price: 30.99, size: '32pk', category_ids: [2, 3])
hunger.items.create(title: "Kids Socks1", description: "Cotton/polyester blend, sizes range 1-9",
   inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])
hunger.items.create(title: "Kids Socks6", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])

 medical.items.create(title: "Tents1", description: "Easy to set up, 8x8",
  inventory: 5000000, price: 30.99, size: '1', category_ids:[3, 4])
 medical.items.create(title: "Sleeping Bag1", description: "Adult sized",
  inventory: 12000000, price: 30.99, size: '1', category_ids:[3])
 medical.items.create(title: "Cot1", description: "Twin Sized Sleeping Cot",
  inventory: 12000000, price: 30.99, size: '1', category_ids:[3])
 medical.items.create(title: "WetVac1", description: "32hz",
  inventory: 15, price: 200.00, size: '1', category_ids: [7, 9])
 medical.items.create(title: "Mops1", description: "Super absorbant",
  inventory: 15, price: 30.99, size: '4pk', category_ids:[7, 10])
 medical.items.create(title: "Power Cord1", description: "15ft, US",
  inventory: 12000000, price: 30.99, size: '3pk', category_ids:[6, 8])
 medical.items.create(title: "Pants6", description: "All sizes",
  inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "Sweaters1", description: "All Sizes",
  inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "T-Shirts1", description: "All Sizes",
  inventory: 15, price: 30.99, size: '200', category_ids: [5])
 medical.items.create(title: "Jackets1", description: "All Sizes",
  inventory: 15, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "Socks8", description: "Wool, all sizes",
  inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "Shoes1", description: "Sneakers, all sizes",
  inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "Undergarments1", description: "All types & sizes",
  inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "Generator1", description: "Outputs 100v",
  inventory: 12000000, price: 300.00, size: '1', category_ids:[3, 6])
 medical.items.create(title: "Brooms1", description: "Standard Brooms",
  inventory: 12000000, price: 30.99, size: '3pk', category_ids:[7])
 medical.items.create(title: "Soap1", description: "Generic bars",
  inventory: 15, price: 30.99, size: '20pk', category_ids: [7,8])
 medical.items.create(title: "Detergent1", description: "Generic detergent",
  inventory: 15, price: 30.99, size: '4pk, 32oz', category_ids:[7])
 medical.items.create(title: "Sponges1", description: "Standard kitchen sponge",
  inventory: 12000000, price: 30.99, size: '20pk', category_ids:[7])
 medical.items.create(title: "WoodChip Clipper1", description: "Small, low power",
  inventory: 12000000, price: 200.00, size: '200', category_ids:[3])
 medical.items.create(title: "Face Masks1", description: "All types & sizes",
  inventory: 12000000, price: 30.99, size: '100pk', category_ids:[1, 3, 8])
medical.items.create(title: "Kids Socks7", description: "Cotton/polyester blend, sizes range 1-9",
    inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])

 medic.items.create(title: "Water1", description: "bottled drinking water",
  inventory: 12000000, price: 30.99, size: '200', category_ids:[3])
 medic.items.create(title: "Van Rental1", description: "8 person van per day",
  inventory: 15, price: 100.99, size: '1 day', category_ids: [4])
 medic.items.create(title: "Truck Rental1", description: "Standard sized pickup truck per day",
  inventory: 15, price: 200.99, size: '1 day', category_ids:[4])
 medic.items.create(title: "Helicopter Pickup1", description: "One location",
  inventory: 12000000, price: 600.99, size: '1 day', category_ids:[4])
 medic.items.create(title: "Hats1", description: "One Size, Varied Colors",
  inventory: 12000000, price: 30.99, size: '5pk', category_ids:[5])
 medic.items.create(title: "Work Boots1", description: "Specify Size",
  inventory: 12000000, price: 30.99, size: '1', category_ids:[5])
 medic.items.create(title: "Long Sleeved Shirts1", description: "Varied Colors, Sizes XS-XL",
  inventory: 15, price: 30.99, size: '10pk', category_ids: [5])
 medic.items.create(title: "Winter Coats1", description: "One Size",
  inventory: 15, price: 30.99, size: '1', category_ids:[5])
 medic.items.create(title: "Wool Socks1", description: "Wool, all sizes",
  inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5])
 medic.items.create(title: "Rain Coat1", description: "One Size",
  inventory: 12000000, price: 30.99, size: '2pk', category_ids:[5])
 medic.items.create(title: "Rain Boots1", description: "Specify Size",
  inventory: 12000000, price: 30.99, size: '1', category_ids:[5])
 medic.items.create(title: "Power Cord0", description: "15ft, US",
  inventory: 12000000, price: 30.99, size: '3pk', category_ids:[6, 8])
 medic.items.create(title: "Pants1", description: "Sizes XS-XXL",
  inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5])
 medic.items.create(title: "Sweaters1", description: "Sizes XS-XXL",
  inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5])
 medic.items.create(title: "T-Shirts1", description: "Sizes XS-XXL",
  inventory: 15, price: 30.99, size: '50pk', category_ids: [5])
 medic.items.create(title: "Jackets1", description: "Size L",
  inventory: 15, price: 30.99, size: '2pk', category_ids:[5])
 medic.items.create(title: "Socks1", description: "Cotton, all sizes",
  inventory: 12000000, price: 30.99, size: '30pk', category_ids:[5])
 medic.items.create(title: "Shoes1", description: "Sneakers, sizes 5-9",
  inventory: 12000000, price: 30.99, size: '5pk', category_ids:[5])
 medic.items.create(title: "Undergarments1", description: "All types & sizes",
  inventory: 12000000, price: 30.99, size: '50pk', category_ids:[5])
 medic.items.create(title: "Generator1", description: "Outputs 100v",
  inventory: 12000000, price: 300.00, size: '1', category_ids:[3, 6])
medic.items.create(title: "Kids Socks8", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])

  safe.items.create(title: "Bandage2", description: "Waterproof Standard Size",
 inventory: 10000000, price: 12.99, size: '100pk, 100/pk', category_ids: [1, 3, 8])
 safe.items.create(title: "Ibuprofin2", description: "200ml, 200 per bottle",
 inventory:12000000, price: 17.99, size: '50pk', category_ids:[1, 3, 8])
 safe.items.create(title: "Gauze2", description: "Cloth, 10ft rolls",
 inventory:3000000, price: 50.99, size: '200pk', category_ids:[1, 8])
 safe.items.create(title: "Neosporin2", description: "Fixes cuts",
 inventory:5000000, price: 23.99, size: '5pk, 16oz/pk', category_ids:[1, 3, 8])
 safe.items.create(title: "Antacids2", description: "200ml, 200 per bottle",
 inventory: 4000000, price: 29.99, size: '200pk', category_ids: [1, 3, 8])
 safe.items.create(title: "Water Bottles2", description: "Fresh Water in individual bottles",
 inventory: 5000000, price: 35.99, size: '32pk', category_ids:[2, 3])
 safe.items.create(title: "Chicken Noodle Soup2", description: "Generic Chicken Soup",
 inventory: 10000000, price: 33.99, size: '10pk, 16oz cans', category_ids: [2, 3])
 safe.items.create(title: "White Rice2", description: "White rice, burlap sack",
 inventory: 10000000, price: 33.99, size: '50 lbs', category_ids:[2, 3])
 safe.items.create(title: "Protien Bars2", description: "Chocolate & Peanutbutter Varieties",
 inventory: 12000000, price: 31.15, size: '30pk, 12 bars/pk', category_ids:[2, 3])
 safe.items.create(title: "Apples2", description: "Red & Green",
 inventory: 12000000, price: 36.99, size: '50 lbs', category_ids:[2, 3])
 safe.items.create(title: "Rope2", description: "Tie to things",
 inventory: 15000000, price: 30.99, size: '50ft', category_ids: [3, 4])
 safe.items.create(title: "Blankets2", description: "Keeps warms, 5x5",
 inventory: 15000000, price: 30.99, size: '5pk', category_ids:[3, 5])
 safe.items.create(title: "Brown Rice2", description: "Brown Rice, burlap sack",
  inventory: 4000000, price: 16.99, size: '50lb', category_ids: [2, 3])
  safe.items.create(title: "Black Beans2", description: "Generic Black Beans",
  inventory: 5000000, price: 35.99, size: '32pk, 16ox', category_ids:[2, 3 ])
  safe.items.create(title: "Kids T Shirts2", description: "Varied colors, mix of XS-XXL",
  inventory: 10000000, price: 33.99, size: '50pk', category_ids: [3, 5])
  safe.items.create(title: "Kids Jackets2", description: "Light coats, varied colors, mix of XS-XXL",
  inventory: 10000000, price: 33.99, size: '50pk', category_ids:[3, 5])
  safe.items.create(title: "Family Tents2", description: "Easily assembled, fits 10x10",
  inventory: 12000000, price: 31.15, size: '10pk', category_ids:[3, 4, 8])
  safe.items.create(title: "Tarp2", description: "10x10",
  inventory: 12000000, price: 36.99, size: '20pk', category_ids:[3, 4])
  safe.items.create(title: "Gallon Water2", description: "Fresh water in gallon sized containers",
  inventory: 15000000, price: 30.99, size: '32pk', category_ids: [2, 3])
  safe.items.create(title: "Kids Socks2", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])
safe.items.create(title: "Kids Socks9", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])

hurricane.items.create(title: "Tents2", description: "Easy to set up, 8x8",
 inventory: 5000000, price: 30.99, size: '1', category_ids:[3, 4])
hurricane.items.create(title: "Sleeping Bag2", description: "Adult sized",
 inventory: 12000000, price: 30.99, size: '1', category_ids:[3])
hurricane.items.create(title: "Cot2", description: "Twin Sized Sleeping Cot",
 inventory: 12000000, price: 30.99, size: '1', category_ids:[3])
hurricane.items.create(title: "WetVac2", description: "32hz",
 inventory: 15, price: 200.00, size: '1', category_ids: [7, 9])
hurricane.items.create(title: "Mops2", description: "Super absorbant",
 inventory: 15, price: 30.99, size: '4pk', category_ids:[7, 10])
hurricane.items.create(title: "Power Cord2", description: "15ft, US",
 inventory: 12000000, price: 30.99, size: '3pk', category_ids:[6, 8])
hurricane.items.create(title: "Pants99", description: "All sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
hurricane.items.create(title: "Sweaters0", description: "All Sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
hurricane.items.create(title: "T-Shirts9", description: "All Sizes",
 inventory: 15, price: 30.99, size: '200', category_ids: [5])
hurricane.items.create(title: "Jackets2", description: "All Sizes",
 inventory: 15, price: 30.99, size: '200', category_ids:[5])
hurricane.items.create(title: "Socks6", description: "Wool, all sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5])
hurricane.items.create(title: "Shoes2", description: "Sneakers, all sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5, 10])
hurricane.items.create(title: "Undergarments00", description: "All types & sizes",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[5, 10])
hurricane.items.create(title: "Generator00", description: "Outputs 100v",
 inventory: 12000000, price: 300.00, size: '1', category_ids:[3, 6, 10])
hurricane.items.create(title: "Brooms2", description: "Standard Brooms",
 inventory: 12000000, price: 30.99, size: '3pk', category_ids:[7, 10])
hurricane.items.create(title: "Soap2", description: "Generic bars",
 inventory: 15, price: 30.99, size: '20pk', category_ids: [7, 8, 10])
hurricane.items.create(title: "Detergent2", description: "Generic detergent",
 inventory: 15, price: 30.99, size: '4pk, 32oz', category_ids:[7, 10])
hurricane.items.create(title: "Sponges2", description: "Standard kitchen sponge",
 inventory: 12000000, price: 30.99, size: '20pk', category_ids:[7, 10])
hurricane.items.create(title: "WoodChip Clipper2", description: "Small, low power",
 inventory: 12000000, price: 200.00, size: '200', category_ids:[3, 10])
hurricane.items.create(title: "Face Masks2", description: "All types & sizes",
 inventory: 12000000, price: 30.99, size: '100pk', category_ids:[1, 3, 8])
 hurricane.items.create(title: "Kids Socks10", description: "Cotton/polyester blend, sizes range 1-9",
   inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])


relief.items.create(title: "Water2", description: "bottled drinking water",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[3])
relief.items.create(title: "Van Rental2", description: "8 person van per day",
 inventory: 15, price: 100.99, size: '1 day', category_ids: [4])
relief.items.create(title: "Truck Rental2", description: "Standard sized pickup truck per day",
 inventory: 15, price: 200.99, size: '1 day', category_ids:[4])
relief.items.create(title: "Helicopter Pickup2", description: "One location",
 inventory: 12000000, price: 600.99, size: '1 day', category_ids:[4])
relief.items.create(title: "Hats2", description: "One Size, Varied Colors",
 inventory: 12000000, price: 30.99, size: '5pk', category_ids:[5])
relief.items.create(title: "Work Boots2", description: "Specify Size",
 inventory: 12000000, price: 30.99, size: '1', category_ids:[5])
relief.items.create(title: "Long Sleeved Shirts2", description: "Varied Colors, Sizes XS-XL",
 inventory: 15, price: 30.99, size: '10pk', category_ids: [5])
relief.items.create(title: "Winter Coats2", description: "One Size",
 inventory: 15, price: 30.99, size: '1', category_ids:[5])
relief.items.create(title: "Wool Socks2", description: "Wool, all sizes",
 inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5])
relief.items.create(title: "Rain Coat2", description: "One Size",
 inventory: 12000000, price: 30.99, size: '2pk', category_ids:[5])
relief.items.create(title: "Rain Boots2", description: "Specify Size",
 inventory: 12000000, price: 30.99, size: '1', category_ids:[5])
relief.items.create(title: "Power Cord2", description: "15ft, US",
 inventory: 12000000, price: 30.99, size: '3pk', category_ids:[6, 8])
relief.items.create(title: "Pants2", description: "Sizes XS-XXL",
 inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5])
relief.items.create(title: "Sweaters2", description: "Sizes XS-XXL",
 inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5])
relief.items.create(title: "T-Shirts2", description: "Sizes XS-XXL",
 inventory: 15, price: 30.99, size: '50pk', category_ids: [5])
relief.items.create(title: "Jackets2", description: "Size L",
 inventory: 15, price: 30.99, size: '2pk', category_ids:[5])
relief.items.create(title: "Socks2", description: "Cotton, all sizes",
 inventory: 12000000, price: 30.99, size: '30pk', category_ids:[5])
relief.items.create(title: "Shoes2", description: "Sneakers, sizes 5-9",
 inventory: 12000000, price: 30.99, size: '5pk', category_ids:[5])
relief.items.create(title: "Undergarments2", description: "All types & sizes",
 inventory: 12000000, price: 30.99, size: '50pk', category_ids:[5])
relief.items.create(title: "Generator2", description: "Outputs 100v",
 inventory: 12000000, price: 300.00, size: '1', category_ids:[3, 6])
relief.items.create(title: "Kids Socks11", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])

disaster.items.create(title: "Water3", description: "bottled drinking water",
 inventory: 12000000, price: 30.99, size: '200', category_ids:[3])
disaster.items.create(title: "Van Rental3", description: "8 person van per day",
 inventory: 15, price: 100.99, size: '1 day', category_ids: [4])
disaster.items.create(title: "Truck Rental3", description: "Standard sized pickup truck per day",
 inventory: 15, price: 200.99, size: '1 day', category_ids:[4])
disaster.items.create(title: "Helicopter Pickup3", description: "One location",
 inventory: 12000000, price: 600.99, size: '1 day', category_ids:[4])
disaster.items.create(title: "Hats3", description: "One Size, Varied Colors",
 inventory: 12000000, price: 30.99, size: '5pk', category_ids:[5])
disaster.items.create(title: "Work Boots3", description: "Specify Size",
 inventory: 12000000, price: 30.99, size: '1', category_ids:[5])
disaster.items.create(title: "Long Sleeved Shirts3", description: "Varied Colors, Sizes XS-XL",
 inventory: 15, price: 30.99, size: '10pk', category_ids: [5])
disaster.items.create(title: "Winter Coats3", description: "One Size",
 inventory: 15, price: 30.99, size: '1', category_ids:[5])
disaster.items.create(title: "Wool Socks3", description: "Wool, all sizes",
 inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5])
disaster.items.create(title: "Rain Coat3", description: "One Size",
 inventory: 12000000, price: 30.99, size: '2pk', category_ids:[5])
disaster.items.create(title: "Rain Boots3", description: "Specify Size",
 inventory: 12000000, price: 30.99, size: '1', category_ids:[5])
disaster.items.create(title: "Power Cord3", description: "15ft, US",
 inventory: 12000000, price: 30.99, size: '3pk', category_ids:[6, 8])
disaster.items.create(title: "Pants3", description: "Sizes XS-XXL",
 inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5])
disaster.items.create(title: "Sweaters3", description: "Sizes XS-XXL",
 inventory: 12000000, price: 30.99, size: '10pk', category_ids:[5])
disaster.items.create(title: "T-Shirts3", description: "Sizes XS-XXL",
 inventory: 15, price: 30.99, size: '50pk', category_ids: [5])
disaster.items.create(title: "Jackets3", description: "Size L",
 inventory: 15, price: 30.99, size: '2pk', category_ids:[5])
disaster.items.create(title: "Socks3", description: "Cotton, all sizes",
 inventory: 12000000, price: 30.99, size: '30pk', category_ids:[5])
disaster.items.create(title: "Shoes3", description: "Sneakers, sizes 5-9",
 inventory: 12000000, price: 30.99, size: '5pk', category_ids:[5])
disaster.items.create(title: "Undergarments3", description: "All types & sizes",
 inventory: 12000000, price: 30.99, size: '50pk', category_ids:[5])
disaster.items.create(title: "Generator3", description: "Outputs 100v",
 inventory: 12000000, price: 300.00, size: '1', category_ids:[3, 6])
disaster.items.create(title: "Kids Socks12", description: "Cotton/polyester blend, sizes range 1-9",
   inventory: 15000000, price: 30.99, size: '32pk', category_ids:[3, 5])

#Make Customers, Address, and UserAddresses
100.times do
  address_index = *(1..10)
  number_of_addresses = address_index.sample

  user = User.create(full_name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "password",
              password_confirmation: "password",
              role: "user",
              display_name: Faker::Name.first_name)

  number_of_addresses.times do
    address = Address.create(street: Faker::Address.street_address,
                    city: Faker::Address.city,
                    state: Faker::Address.state_abbr,
                      zip: Faker::Address.zip,
                  shipping: [true, false].sample)

    UserAddress.create(user_id: user.id, address_id: address.id)
  end
end


#Makes pickup orders
100.times do
  user = *(1..123)
  items_amount = *(1..50)
  quantity = *(1..500)
  number_of_items = items_amount.sample

  order = Order.create(user_id: user.sample,
                      order_total: 0,
                      order_type: 'pick-up',
                      delivery_address_id: nil,
                      order_status:["completed", "cancelled", "ordered", "paid", "pending"].sample)
  items = *(1..200)
  number_of_items.times do
    item = items.sample
    OrderItem.create(order_id: order.id, item_id: item, quantity: quantity.sample)
    items.delete(item)
  end

  total = order.order_items.reduce(0) do |total, order_item|
    total += order_item.subtotal
  end

  order.update_attribute(:order_total, total)
  order.create_sub_orders
end

#Makes delivery orders
100.times do
  users = *(1..123)
  user = users.sample
  items_amount = *(1..50)
  quantity = *(1..500)
  number_of_items = items_amount.sample

  address = Address.create(street: Faker::Address.street_address,
                            city: Faker::Address.city,
                            state: Faker::Address.state_abbr,
                            zip: Faker::Address.zip,
                            shipping: true)

  UserAddress.create(user_id: user, address_id: address.id)

  order = Order.create(user_id: user,
                      order_total: 0,
                      order_type: 'delivery',
                      delivery_address_id: address.id,
                      order_status:["completed", "cancelled", "ordered", "paid", "pending"].sample)
  items = *(1..200)
  number_of_items.times do
    item = items.sample
    OrderItem.create(order_id: order.id, item_id: item, quantity: quantity.sample)
    items.delete(item)
  end

  total = order.order_items.reduce(0) do |total, order_item|
    total += order_item.subtotal
  end

  order.update_attribute(:order_total, total)
  order.create_sub_orders
end

FeaturedSupplier.update

"======= Shit has been seeded ========"
