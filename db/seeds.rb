Category.create(name: "Medicine")
Category.create(name: "Food")
Category.create(name: "Survival")
Category.create(name: "Mounting")
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
truck = File.new("#{Rails.root}/app/assets/images/truck.jpg")
van = File.new("#{Rails.root}/app/assets/images/van.jpg")
rice = File.new("#{Rails.root}/app/assets/images/rice.jpg")
blankets = File.new("#{Rails.root}/app/assets/images/blankets.jpg")
sweaters = File.new("#{Rails.root}/app/assets/images/sweaters.jpg")
socks = File.new("#{Rails.root}/app/assets/images/socks.jpg")
rope = File.new("#{Rails.root}/app/assets/images/rope.jpg")
pants = File.new("#{Rails.root}/app/assets/images/pants.jpg")
soup = File.new("#{Rails.root}/app/assets/images/soup.jpg")
apples = File.new("#{Rails.root}/app/assets/images/apples.jpg")



hunger_picture = File.new("#{Rails.root}/app/assets/images/hunger_relief.jpg")
medical_picture = File.new("#{Rails.root}/app/assets/images/medical_supply.png")
medic_picture = File.new("#{Rails.root}/app/assets/images/medic.jpeg")
safe_picture = File.new("#{Rails.root}/app/assets/images/safe.jpeg")
hurricane_picture = File.new("#{Rails.root}/app/assets/images/hurricane.jpg")
relief_picture = File.new("#{Rails.root}/app/assets/images/relief.jpeg")
disaster_picture = File.new("#{Rails.root}/app/assets/images/disaster.jpeg")


kids = Supplier.create(name: 'Help the Kids', url: 'savethechildren', description: 'You can make a difference in the life of a child. One kid at a time.', enabled: true, picture: kids_picture)
tsunami = Supplier.create(name: 'Tsunami Relief', url: "tsunami-relief", description: 'Help rebuild tsunami affected communities. Because extreme tidal waves are not nice.', enabled: true, picture: tsunami_picture)
wildfire = Supplier.create(name: 'Wildfire Recovery Team', url: 'wildfire-relief', description: 'Rebuilding the ashes, because no one wants to live in a pile of dust.', enabled: true, picture: wildfire_picture)
hunger = Supplier.create(name: 'HungerRelief', url: 'hungerrelief', description: 'Preventing hunger is our mission. Offering a wide range of perish resistent goods.', enabled: true, picture: hunger_picture)
medical = Supplier.create(name: 'Medical Supply Fund', url: 'medical-supply-fund', description: 'Unbeatable prices on cutting edge supplies to treat ailments caused by natural events.', enabled: true, picture: medical_picture)
medic = Supplier.create(name: 'MedicSupply', url: 'medicsupply', description: 'Stocks rare medical equipments suitable for all purposes.', enabled: true, picture: medic_picture)
safe = Supplier.create(name: 'SafeStart', url: 'safestart', description: 'Ensuring every child is cared for. No child is left behind.', enabled: true, picture: safe_picture)
hurricane = Supplier.create(name: 'Hurricane Recovery', url: 'hurricanerecovery', description: 'Recovery from the unexpected. Supplies to you freaky fast.', enabled: true, picture: hurricane_picture)
relief = Supplier.create(name: 'Relief Without Borders', url: 'relief-without-borders', description: 'The world is not as big as you may think.  We\'re all in this together.  Help relieve the World.', enabled: true, picture: relief_picture)
disaster = Supplier.create(name: 'Disaster Relief', url: 'disaster-relief', description: 'Disaster Relief for Everyone. Are you in good hands?', enabled: true, picture: disaster_picture)

SuppliersUser.create(supplier_id: kids.id, user_id: josh.id)
SuppliersUser.create(supplier_id: tsunami.id, user_id: tan.id)

kids.items.create(title: "Bandages", description: "Waterproof Standard Size",
 inventory: 1000, price: 12.99, size: '100pk, 100/pk', category_ids: [1, 3, 8], picture: bandages)
kids.items.create(title: "Ibuprofen", description: "200ml, 200 per bottle",
 inventory: 120, price: 17.99, size: '50pk', category_ids:[1, 3, 8], picture: ibuprofen)
kids.items.create(title: "Gauze", description: "Cloth, 10ft rolls",
 inventory:3000, price: 50.99, size: '200pk', category_ids:[1, 8], picture: gauze)
kids.items.create(title: "Neosporin", description: "Fixes cuts",
 inventory:5000, price: 23.99, size: '5pk, 16oz/pk', category_ids:[1, 3, 8])
kids.items.create(title: "Antacids", description: "200ml, 200 per bottle",
 inventory: 4000, price: 29.99, size: '200pk', category_ids: [1, 3, 8])
kids.items.create(title: "Water Bottles", description: "Fresh Water in individual bottles",
 inventory: 5000, price: 35.99, size: '32pk', category_ids:[2, 3])
kids.items.create(title: "Chicken Noodle Soup", description: "Generic Chicken Soup",
 inventory: 1000, price: 33.99, size: '10pk, 16oz cans', category_ids: [2, 3], picture: soup)
kids.items.create(title: "White Rice", description: "White rice, burlap sack",
 inventory: 1000, price: 33.99, size: '50 lbs', category_ids:[2, 3], picture: rice)
kids.items.create(title: "Protien Bars", description: "Chocolate & Peanutbutter Varieties",
 inventory: 120, price: 31.15, size: '30pk, 12 bars/pk', category_ids:[2, 3])
kids.items.create(title: "Apples", description: "Red & Green",
 inventory: 120, price: 36.99, size: '50 lbs', category_ids:[2, 3], picture: apples)
kids.items.create(title: "Rope", description: "Tie to things",
 inventory: 150, price: 30.99, size: '50ft', category_ids: [3, 4], picture: rope)
kids.items.create(title: "Blankets", description: "Keeps warms, 5x5",
 inventory: 150, price: 30.99, size: '5pk', category_ids:[3, 5], picture: blankets)
kids.items.create(title: "Brown Rice", description: "Brown Rice, burlap sack",
  inventory: 4000, price: 16.99, size: '50lb', category_ids: [2, 3])
kids.items.create(title: "Black Beans", description: "Generic Black Beans",
  inventory: 5000, price: 35.99, size: '32pk, 16ox', category_ids:[2, 3 ])
kids.items.create(title: "Kids T Shirts", description: "Varied colors, mix of XS-XXL",
  inventory: 1000, price: 33.99, size: '50pk', category_ids: [3, 5])
kids.items.create(title: "Kids Jackets", description: "Light coats, varied colors, mix of XS-XXL",
  inventory: 1000, price: 33.99, size: '50pk', category_ids:[3, 5])
kids.items.create(title: "Family tent", description: "Easily assembled, fits 10x10",
  inventory: 120, price: 31.15, size: '10pk', category_ids:[3, 4, 8])
kids.items.create(title: "Tarp", description: "10x10",
  inventory: 120, price: 36.99, size: '20pk', category_ids:[3, 4])
kids.items.create(title: "Gallon Water", description: "Fresh water in gallon sized containers",
  inventory: 150, price: 30.99, size: '32pk', category_ids: [2, 3])
kids.items.create(title: "Kids Socks", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])
kids.items.create(title: "Adult Socks", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])

tsunami.items.create(title: "Tents", description: "Easy to set up, 8x8",
 inventory: 5000, price: 30.99, size: '1', category_ids:[3, 4], picture: tent)
tsunami.items.create(title: "Sleeping Bag", description: "Adult sized",
 inventory: 120, price: 30.99, size: '1', category_ids:[3], picture: sleepingbag)
tsunami.items.create(title: "Cot", description: "Twin Sized Sleeping Cot",
 inventory: 120, price: 30.99, size: '1', category_ids:[3], picture: cot)
tsunami.items.create(title: "WetVac", description: "32hz",
 inventory: 15, price: 200.00, size: '1', category_ids: [7, 9])
tsunami.items.create(title: "Mops", description: "Super absorbant",
 inventory: 15, price: 30.99, size: '4pk', category_ids:[7, 10])
tsunami.items.create(title: "Power Cord", description: "15ft, US",
 inventory: 120, price: 30.99, size: '3pk', category_ids:[6, 8])
tsunami.items.create(title: "Pants", description: "All sizes",
 inventory: 120, price: 30.99, size: '200', category_ids:[5])
tsunami.items.create(title: "Sweaters", description: "All Sizes",
 inventory: 120, price: 30.99, size: '200', category_ids:[5], picture: sweaters)
tsunami.items.create(title: "T-Shirts", description: "All Sizes",
 inventory: 15, price: 30.99, size: '200', category_ids: [5])
tsunami.items.create(title: "Jackets", description: "All Sizes",
 inventory: 15, price: 30.99, size: '200', category_ids:[5])
tsunami.items.create(title: "Socks", description: "Wool, all sizes",
 inventory: 120, price: 30.99, size: '200', category_ids:[5], picture: socks)
tsunami.items.create(title: "Snow Shoes", description: "Sneakers, all sizes",
 inventory: 120, price: 30.99, size: '200', category_ids:[5])
tsunami.items.create(title: "Undergarments", description: "All types & sizes",
 inventory: 120, price: 30.99, size: '200', category_ids:[5])
tsunami.items.create(title: "Generator", description: "Outputs 100v",
 inventory: 120, price: 300.00, size: '1', category_ids:[3, 6])
tsunami.items.create(title: "Brooms", description: "Standard Brooms",
 inventory: 120, price: 30.99, size: '3pk', category_ids:[7])
tsunami.items.create(title: "Soap", description: "Generic bars",
 inventory: 15, price: 30.99, size: '20pk', category_ids: [7,8])
tsunami.items.create(title: "Detergent", description: "Generic detergent",
 inventory: 15, price: 30.99, size: '4pk, 32oz', category_ids:[7])
tsunami.items.create(title: "Sponges", description: "Standard kitchen sponge",
 inventory: 120, price: 30.99, size: '20pk', category_ids:[7])
tsunami.items.create(title: "WoodChip Clipper", description: "Small, low power",
 inventory: 120, price: 200.00, size: '200', category_ids:[3])
tsunami.items.create(title: "Face Masks", description: "All types & sizes",
  inventory: 120, price: 30.99, size: '100pk', category_ids:[1, 3, 8])
tsunami.items.create(title: "Gap Socks for Babies", description: "Cotton/polyester blend, sizes range 1-9",
 inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])

wildfire.items.create(title: "Water", description: "bottled drinking water",
 inventory: 120, price: 30.99, size: '200', category_ids:[3], picture: water)
wildfire.items.create(title: "Van Rental", description: "8 person van per day",
 inventory: 15, price: 100.99, size: '1 day', category_ids: [4], picture: van)
wildfire.items.create(title: "Truck Rental", description: "Standard sized pickup truck per day",
 inventory: 15, price: 200.99, size: '1 day', category_ids:[4], picture: truck)
wildfire.items.create(title: "Helicopter Pickup", description: "One location",
 inventory: 120, price: 600.99, size: '1 day', category_ids:[4, 11])
wildfire.items.create(title: "Hats", description: "One Size, Varied Colors",
 inventory: 120, price: 30.99, size: '5pk', category_ids:[5,11])
wildfire.items.create(title: "Work Boots", description: "Specify Size",
 inventory: 120, price: 30.99, size: '1', category_ids:[5])
wildfire.items.create(title: "Long Sleeved Shirts", description: "Varied Colors, Sizes XS-XL",
 inventory: 15, price: 30.99, size: '10pk', category_ids: [5])
wildfire.items.create(title: "Winter Coats", description: "One Size",
 inventory: 15, price: 30.99, size: '1', category_ids:[5])
wildfire.items.create(title: "Wool Socks", description: "Wool, all sizes",
 inventory: 120, price: 30.99, size: '10pk', category_ids:[5,11])
wildfire.items.create(title: "Rain Coat", description: "One Size",
 inventory: 120, price: 30.99, size: '2pk', category_ids:[5])
wildfire.items.create(title: "Rain Boots", description: "Specify Size",
 inventory: 120, price: 30.99, size: '1', category_ids:[5])
wildfire.items.create(title: "Power Cord", description: "15ft, US",
 inventory: 120, price: 30.99, size: '3pk', category_ids:[6, 8])
wildfire.items.create(title: "Pants12", description: "Sizes XS-XXL",
 inventory: 120, price: 30.99, size: '10pk', category_ids:[5, 11])
wildfire.items.create(title: "Sweaters12", description: "Sizes XS-XXL",
 inventory: 120, price: 30.99, size: '10pk', category_ids:[5])
wildfire.items.create(title: "Tees", description: "Sizes XS-XXL",
 inventory: 15, price: 30.99, size: '50pk', category_ids: [5])
wildfire.items.create(title: "Heavy Duty Jacket", description: "Size L",
 inventory: 15, price: 30.99, size: '2pk', category_ids:[5])
wildfire.items.create(title: "Baby Socks", description: "Cotton, all sizes",
 inventory: 120, price: 30.99, size: '30pk', category_ids:[5])
wildfire.items.create(title: "Water Proof Shoes", description: "Sneakers, sizes 5-9",
 inventory: 120, price: 30.99, size: '5pk', category_ids:[5, 11])
wildfire.items.create(title: "Underwear", description: "All types & sizes",
 inventory: 120, price: 30.99, size: '50pk', category_ids:[5])
wildfire.items.create(title: "Generator 5000", description: "Outputs 100v",
 inventory: 120, price: 300.00, size: '1', category_ids:[3, 6, 11])
wildfire.items.create(title: "Kids Socks5", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])

hunger.items.create(title: "Bandage", description: "Waterproof Standard Size",
  inventory: 1000, price: 12.99, size: '100pk, 100/pk', category_ids: [1, 3, 8], picture: bandages)
hunger.items.create(title: "Generic Ibuprofen", description: "200ml, 200 per bottle",
  inventory: 120, price: 17.99, size: '50pk', category_ids:[1, 3, 8], picture: ibuprofen)
hunger.items.create(title: "Gauzee", description: "Cloth, 10ft rolls",
  inventory:3000, price: 50.99, size: '200pk', category_ids:[1, 8], picture: gauze)
hunger.items.create(title: "Neosporeen", description: "Fixes cuts",
  inventory:5000, price: 23.99, size: '5pk, 16oz/pk', category_ids:[1, 3, 8])
hunger.items.create(title: "Antyacids", description: "200ml, 200 per bottle",
  inventory: 4000, price: 29.99, size: '200pk', category_ids: [1, 3, 8])
hunger.items.create(title: "Aquafina", description: "Fresh Water in individual bottles",
  inventory: 5000, price: 35.99, size: '32pk', category_ids:[2, 3])
hunger.items.create(title: "Chicken Noodle Soup1", description: "Generic Chicken Soup",
  inventory: 1000, price: 33.99, size: '10pk, 16oz cans', category_ids: [2, 3])
hunger.items.create(title: 'Jasemin Rice', description: "White rice, burlap sack",
  inventory: 1000, price: 33.99, size: '50 lbs', category_ids:[2, 3])
hunger.items.create(title: "Cliff Bars", description: "Chocolate & Peanutbutter Varieties",
  inventory: 120, price: 31.15, size: '30pk, 12 bars/pk', category_ids:[2, 3])
hunger.items.create(title: "Granny Smith", description: "Red & Green",
  inventory: 120, price: 36.99, size: '50 lbs', category_ids:[2, 3])
hunger.items.create(title: "Leather Rope", description: "Tie to things",
  inventory: 150, price: 30.99, size: '50ft', category_ids: [3, 4])
hunger.items.create(title: "Quilts", description: "Keeps warms, 5x5",
  inventory: 150, price: 30.99, size: '5pk', category_ids:[3, 5])
hunger.items.create(title: "Basmati Brown Rice", description: "Brown Rice, burlap sack",
   inventory: 4000, price: 16.99, size: '50lb', category_ids: [2, 3])
hunger.items.create(title: "Pinto Beans", description: "Generic Black Beans",
   inventory: 5000, price: 35.99, size: '32pk, 16ox', category_ids:[2, 3 ])
hunger.items.create(title: "Kids Shirts XL", description: "Varied colors, mix of XS-XXL",
   inventory: 1000, price: 33.99, size: '50pk', category_ids: [3, 5])
hunger.items.create(title: "Kids Jackets XL", description: "Light coats, varied colors, mix of XS-XXL",
   inventory: 1000, price: 33.99, size: '50pk', category_ids:[3, 5])
hunger.items.create(title: "One Man Tent", description: "Easily assembled, fits 10x10",
   inventory: 120, price: 31.15, size: '10pk', category_ids:[3, 4, 8])
hunger.items.create(title: "Coleman Tarp", description: "10x10",
   inventory: 120, price: 36.99, size: '20pk', category_ids:[3, 4])
hunger.items.create(title: "Gallon Water1", description: "Fresh water in gallon sized containers",
   inventory: 150, price: 30.99, size: '32pk', category_ids: [2, 3])
hunger.items.create(title: "Mitts", description: "Cotton/polyester blend, sizes range 1-9",
   inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])
hunger.items.create(title: "Scarf", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])

 medical.items.create(title: "Walmart Tent", description: "Easy to set up, 8x8",
  inventory: 5000, price: 30.99, size: '1', category_ids:[3, 4], picture: tent)
 medical.items.create(title: "Walmart Sleeping Bag", description: "Adult sized",
  inventory: 120, price: 30.99, size: '1', category_ids:[3], picture: sleepingbag)
 medical.items.create(title: "Coleman Cot", description: "Twin Sized Sleeping Cot",
  inventory: 120, price: 30.99, size: '1', category_ids:[3], picture: cot)
 medical.items.create(title: "Indestructible Dyson Vacuum", description: "32hz",
  inventory: 15, price: 200.00, size: '1', category_ids: [7, 9])
 medical.items.create(title: "Wetjet", description: "Super absorbant",
  inventory: 15, price: 30.99, size: '4pk', category_ids:[7, 10])
 medical.items.create(title: "Outlets", description: "15ft, US",
  inventory: 120, price: 30.99, size: '3pk', category_ids:[6, 8])
 medical.items.create(title: "Shorts", description: "All sizes",
  inventory: 120, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "Ugly Christmas Sweaters", description: "All Sizes",
  inventory: 120, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "Wife Beaters", description: "All Sizes",
  inventory: 15, price: 30.99, size: '200', category_ids: [5])
 medical.items.create(title: "Down Jackets", description: "All Sizes",
  inventory: 15, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "Lowrises", description: "Wool, all sizes",
  inventory: 120, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "High Heels", description: "Sneakers, all sizes",
  inventory: 120, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "White Tidys", description: "All types & sizes",
  inventory: 120, price: 30.99, size: '200', category_ids:[5])
 medical.items.create(title: "Generator1", description: "Outputs 100v",
  inventory: 120, price: 300.00, size: '1', category_ids:[3, 6])
 medical.items.create(title: "Industrial Broom", description: "Standard Brooms",
  inventory: 120, price: 30.99, size: '3pk', category_ids:[7])
 medical.items.create(title: "Organic Soap", description: "For those with sensitive skin",
  inventory: 15, price: 30.99, size: '20pk', category_ids: [7,8])
 medical.items.create(title: "All", description: "Generic detergent",
  inventory: 15, price: 30.99, size: '4pk, 32oz', category_ids:[7])
 medical.items.create(title: "Bubbles Sponge", description: "Standard kitchen sponge",
  inventory: 120, price: 30.99, size: '20pk', category_ids:[7])
 medical.items.create(title: "WoodChip Clipper1", description: "Small, low power",
  inventory: 120, price: 200.00, size: '200', category_ids:[3])
 medical.items.create(title: "3M Face Mask", description: "All types & sizes",
  inventory: 120, price: 30.99, size: '100pk', category_ids:[1, 3, 8])
medical.items.create(title: "High Socks", description: "Cotton/polyester blend, sizes range 1-9",
    inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])

 medic.items.create(title: "Vitamin Water", description: "bottled drinking water",
  inventory: 120, price: 30.99, size: '200', category_ids:[3], picture: water)
 medic.items.create(title: "Mega Van", description: "8 person van per day",
  inventory: 15, price: 100.99, size: '1 day', category_ids: [4], picture: van)
 medic.items.create(title: "Monster Truck", description: "Standard sized pickup truck per day",
  inventory: 15, price: 200.99, size: '1 day', category_ids:[4], picture: truck)
 medic.items.create(title: "Golden Helicopter", description: "One location",
  inventory: 120, price: 600.99, size: '1 day', category_ids:[4])
 medic.items.create(title: "Waterproof Hats", description: "One Size, Varied Colors",
  inventory: 120, price: 30.99, size: '5pk', category_ids:[5])
 medic.items.create(title: "Heavy Duty Work Boots", description: "Specify Size",
  inventory: 120, price: 30.99, size: '1', category_ids:[5])
 medic.items.create(title: "Shirts With Long Sleeves", description: "Varied Colors, Sizes XS-XL",
  inventory: 15, price: 30.99, size: '10pk', category_ids: [5])
 medic.items.create(title: "Fur Winter Coats", description: "One Size",
  inventory: 15, price: 30.99, size: '1', category_ids:[5])
 medic.items.create(title: "Wool Socks XL", description: "Wool, all sizes",
  inventory: 120, price: 30.99, size: '10pk', category_ids:[5])
 medic.items.create(title: "Rain Coat1", description: "One Size",
  inventory: 120, price: 30.99, size: '2pk', category_ids:[5])
 medic.items.create(title: "Rain Boots Extra Durable", description: "To keep the rain out",
  inventory: 120, price: 30.99, size: '1', category_ids:[5])
 medic.items.create(title: "Power Cord Generic", description: "15ft, US",
  inventory: 120, price: 30.99, size: '3pk', category_ids:[6, 8])
 medic.items.create(title: "Levis", description: "Sizes XS-XXL",
  inventory: 120, price: 30.99, size: '10pk', category_ids:[5])
 medic.items.create(title: "Warm Sweaters", description: "Sizes XS-XXL",
  inventory: 120, price: 30.99, size: '10pk', category_ids:[5])
 medic.items.create(title: "Hanes Tees", description: "Sizes XS-XXL",
  inventory: 15, price: 30.99, size: '50pk', category_ids: [5])
 medic.items.create(title: "Dickies Jackets", description: "Size L",
  inventory: 15, price: 30.99, size: '2pk', category_ids:[5])
 medic.items.create(title: "Hanes Socks", description: "Cotton, all sizes",
  inventory: 120, price: 30.99, size: '30pk', category_ids:[5])
 medic.items.create(title: "Reeboks", description: "Sneakers, sizes 5-9",
  inventory: 120, price: 30.99, size: '5pk', category_ids:[5])
 medic.items.create(title: "Victoria Secret", description: "All types & sizes",
  inventory: 120, price: 30.99, size: '50pk', category_ids:[5])
 medic.items.create(title: "Honda Generator", description: "Outputs 100v",
  inventory: 120, price: 300.00, size: '1', category_ids:[3, 6])
medic.items.create(title: "Van Kid's Socks", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])

  safe.items.create(title: "Band-Aid", description: "Waterproof Standard Size",
 inventory: 1000, price: 12.99, size: '100pk, 100/pk', category_ids: [1, 3, 8], picture: bandages)
 safe.items.create(title: "Vicks Ibuprofen", description: "200ml, 200 per bottle",
 inventory: 120, price: 17.99, size: '50pk', category_ids:[1, 3, 8], picture: ibuprofen)
 safe.items.create(title: "J&J Gauze", description: "Cloth, 10ft rolls",
 inventory:3000, price: 50.99, size: '200pk', category_ids:[1, 8], picture: gauze)
 safe.items.create(title: "Hydrogen Peroxide", description: "Fixes cuts",
 inventory:5000, price: 23.99, size: '5pk, 16oz/pk', category_ids:[1, 3, 8])
 safe.items.create(title: "Tums", description: "200ml, 200 per bottle",
 inventory: 4000, price: 29.99, size: '200pk', category_ids: [1, 3, 8])
 safe.items.create(title: "Fiji", description: "Fresh Water in individual bottles",
 inventory: 5000, price: 35.99, size: '32pk', category_ids:[2, 3])
 safe.items.create(title: "Campbell's Chicken Noodle Soup", description: "Generic Chicken Soup",
 inventory: 1000, price: 33.99, size: '10pk, 16oz cans', category_ids: [2, 3])
 safe.items.create(title: "Short White Rice", description: "White rice, burlap sack",
 inventory: 1000, price: 33.99, size: '50 lbs', category_ids:[2, 3])
 safe.items.create(title: "Power bar", description: "Chocolate & Peanutbutter Varieties",
 inventory: 120, price: 31.15, size: '30pk, 12 bars/pk', category_ids:[2, 3])
 safe.items.create(title: "Gaia Apples", description: "Red & Green",
 inventory: 120, price: 36.99, size: '50 lbs', category_ids:[2, 3])
 safe.items.create(title: "Parachute Cord", description: "Tie to things",
 inventory: 150, price: 30.99, size: '50ft', category_ids: [3, 4])
 safe.items.create(title: "Comforters", description: "Keeps warms, 5x5",
 inventory: 150, price: 30.99, size: '5pk', category_ids:[3, 5])
 safe.items.create(title: "Uncle Ben's Brown Rice", description: "Brown Rice, burlap sack",
  inventory: 4000, price: 16.99, size: '50lb', category_ids: [2, 3])
  safe.items.create(title: "Kidney Beans", description: "Generic Black Beans",
  inventory: 5000, price: 35.99, size: '32pk, 16ox', category_ids:[2, 3 ])
  safe.items.create(title: "Kid's Wife Beater", description: "Varied colors, mix of XS-XXL",
  inventory: 1000, price: 33.99, size: '50pk', category_ids: [3, 5])
  safe.items.create(title: "Patagonia Coat", description: "Light coats, varied colors, mix of XS-XXL",
  inventory: 1000, price: 33.99, size: '50pk', category_ids:[3, 5])
  safe.items.create(title: "Patagonia Tent", description: "Easily assembled, fits 10x10",
  inventory: 120, price: 31.15, size: '10pk', category_ids:[3, 4, 8])
  safe.items.create(title: "3M Tarps", description: "10x10",
  inventory: 120, price: 36.99, size: '20pk', category_ids:[3, 4])
  safe.items.create(title: "Deep Rock Gallon", description: "Fresh water in gallon sized containers",
  inventory: 150, price: 30.99, size: '32pk', category_ids: [2, 3])
  safe.items.create(title: "Fruit of The Loom Socks", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])
safe.items.create(title: "Argyle Socks", description: "Cotton/polyester blend, sizes range 1-9",
  inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])

hurricane.items.create(title: "Air Matress", description: "Easy to set up, 8x8",
 inventory: 5000, price: 30.99, size: '1', category_ids:[3, 4], picture: tent)
hurricane.items.create(title: "Sleeping Sack", description: "Adult sized",
 inventory: 120, price: 30.99, size: '1', category_ids:[3], picture: sleepingbag)
hurricane.items.create(title: "Cot2", description: "Twin Sized Sleeping Cot",
 inventory: 120, price: 30.99, size: '1', category_ids:[3], picture: cot)
hurricane.items.create(title: "Hoover Wetvac", description: "32hz",
 inventory: 15, price: 200.00, size: '1', category_ids: [7, 9])
hurricane.items.create(title: "Swiffer Mops", description: "Super absorbant",
 inventory: 15, price: 30.99, size: '4pk', category_ids:[7, 10])
hurricane.items.create(title: "GE powercord", description: "15ft, US",
 inventory: 120, price: 30.99, size: '3pk', category_ids:[6, 8])
hurricane.items.create(title: "Hanes Sweatpants", description: "All sizes",
 inventory: 120, price: 30.99, size: '200', category_ids:[5])
hurricane.items.create(title: "Wrangler Sweaters", description: "All Sizes",
 inventory: 120, price: 30.99, size: '200', category_ids:[5])
hurricane.items.create(title: "Starter Shirts", description: "All Sizes",
 inventory: 15, price: 30.99, size: '200', category_ids: [5])
hurricane.items.create(title: "Industrial Jacket", description: "All Sizes",
 inventory: 15, price: 30.99, size: '200', category_ids:[5])
hurricane.items.create(title: "Industrial Socks", description: "Wool, all sizes",
 inventory: 120, price: 30.99, size: '200', category_ids:[5])
hurricane.items.create(title: "Steeltoe Shoes", description: "Sneakers, all sizes",
 inventory: 120, price: 30.99, size: '200', category_ids:[5, 10])
hurricane.items.create(title: "Foddle Underwear", description: "All types & sizes",
 inventory: 120, price: 30.99, size: '200', category_ids:[5, 10])
hurricane.items.create(title: "Mitsubishi Generator", description: "Outputs 100v",
 inventory: 120, price: 300.00, size: '1', category_ids:[3, 6, 10])
hurricane.items.create(title: "Asian Broom", description: "Standard Brooms",
 inventory: 120, price: 30.99, size: '3pk', category_ids:[7, 10])
hurricane.items.create(title: "Dove Soap", description: "For soft skins",
 inventory: 15, price: 30.99, size: '20pk', category_ids: [7, 8, 10])
hurricane.items.create(title: "Tide", description: "Generic detergent",
 inventory: 15, price: 30.99, size: '4pk, 32oz', category_ids:[7, 10])
hurricane.items.create(title: "Scotts", description: "Standard kitchen sponge",
 inventory: 120, price: 30.99, size: '20pk', category_ids:[7, 10])
hurricane.items.create(title: "WoodChip Clipper 5000", description: "Small, low power",
 inventory: 120, price: 200.00, size: '200', category_ids:[3, 10])
hurricane.items.create(title: "3M Face Masks", description: "All types & sizes",
 inventory: 120, price: 30.99, size: '100pk', category_ids:[1, 3, 8])
 hurricane.items.create(title: "Polo Socks", description: "Cotton/polyester blend, sizes range 1-9",
   inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])


relief.items.create(title: "Arrowhead Water", description: "bottled drinking water",
 inventory: 120, price: 30.99, size: '200', category_ids:[3], picture: water)
relief.items.create(title: "Honda Odyssey", description: "8 person van per day",
 inventory: 15, price: 100.99, size: '1 day', category_ids: [4], picture: van)
relief.items.create(title: "Honda Ridgeline", description: "Standard sized pickup truck per day",
 inventory: 15, price: 200.99, size: '1 day', category_ids:[4], picture: truck)
relief.items.create(title: "Mitsubishi Helicopter", description: "One location",
 inventory: 120, price: 600.99, size: '1 day', category_ids:[4])
relief.items.create(title: "Nike Hat", description: "One Size, Varied Colors",
 inventory: 120, price: 30.99, size: '5pk', category_ids:[5])
relief.items.create(title: "Work Unicorm", description: "Specify Size",
 inventory: 120, price: 30.99, size: '1', category_ids:[5])
relief.items.create(title: "Heavy Duty Long Sleeves", description: "Varied Colors, Sizes XS-XL",
 inventory: 15, price: 30.99, size: '10pk', category_ids: [5])
relief.items.create(title: "Indestructible Long Shirt", description: "One Size",
 inventory: 15, price: 30.99, size: '1', category_ids:[5])
relief.items.create(title: "Monster Socks", description: "Wool, all sizes",
 inventory: 120, price: 30.99, size: '10pk', category_ids:[5])
relief.items.create(title: "Yellow Rain Coat", description: "One Size",
 inventory: 120, price: 30.99, size: '2pk', category_ids:[5])
relief.items.create(title: "Yellow Rain Boots", description: "Specify Size",
 inventory: 120, price: 30.99, size: '1', category_ids:[5])
relief.items.create(title: "Samsung Power Cord", description: "15ft, US",
 inventory: 120, price: 30.99, size: '3pk', category_ids:[6, 8])
relief.items.create(title: "Yoga Pants", description: "Sizes XS-XXL",
 inventory: 120, price: 30.99, size: '10pk', category_ids:[5])
relief.items.create(title: "Thick Sweaters", description: "Sizes XS-XXL",
 inventory: 120, price: 30.99, size: '10pk', category_ids:[5])
relief.items.create(title: "Tiny T-Shirts", description: "Sizes XS-XXL",
 inventory: 15, price: 30.99, size: '50pk', category_ids: [5])
relief.items.create(title: "Snow Jacket", description: "Size L",
 inventory: 15, price: 30.99, size: '2pk', category_ids:[5])
relief.items.create(title: "Snow Socks", description: "Cotton, all sizes",
 inventory: 120, price: 30.99, size: '30pk', category_ids:[5])
relief.items.create(title: "Flip-Flops", description: "Sneakers, sizes 5-9",
 inventory: 120, price: 30.99, size: '5pk', category_ids:[5])
relief.items.create(title: "Underarmor Wear", description: "All types & sizes",
 inventory: 120, price: 30.99, size: '50pk', category_ids:[5])
relief.items.create(title: "Samsung Generator", description: "Outputs 100v",
 inventory: 120, price: 300.00, size: '1', category_ids:[3, 6])
relief.items.create(title: "Beanies", description: "Cotton/polyester blend, one size fits all.",
  inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])

disaster.items.create(title: "Kroger Water", description: "bottled drinking water",
 inventory: 120, price: 30.99, size: '200', category_ids:[3], picture: water)
disaster.items.create(title: "White Van", description: "8 person van per day",
 inventory: 15, price: 100.99, size: '1 day', category_ids: [4], picture: van)
disaster.items.create(title: "Dodge Truck", description: "Standard sized pickup truck per day",
 inventory: 15, price: 200.99, size: '1 day', category_ids:[4], picture: truck)
disaster.items.create(title: "Presidential Helicopter", description: "One location",
 inventory: 120, price: 600.99, size: '1 day', category_ids:[4])
disaster.items.create(title: "Van's Hats", description: "One Size, Varied Colors",
 inventory: 120, price: 30.99, size: '5pk', category_ids:[5])
disaster.items.create(title: "Boots For Working", description: "Specify Size",
 inventory: 120, price: 30.99, size: '1', category_ids:[5])
disaster.items.create(title: "Gloves", description: "Varied Colors, Sizes XS-XL",
 inventory: 15, price: 30.99, size: '10pk', category_ids: [5])
disaster.items.create(title: "Silk Coat", description: "One Size",
 inventory: 15, price: 30.99, size: '1', category_ids:[5])
disaster.items.create(title: "Silks Socks", description: "Wool, all sizes",
 inventory: 120, price: 30.99, size: '10pk', category_ids:[5])
disaster.items.create(title: "Pink Rain Coat", description: "One Size",
 inventory: 120, price: 30.99, size: '2pk', category_ids:[5])
disaster.items.create(title: "Military Rain Boots", description: "Specify Size",
 inventory: 120, price: 30.99, size: '1', category_ids:[5])
disaster.items.create(title: "Sharp Generator", description: "15ft, US",
 inventory: 120, price: 30.99, size: '3pk', category_ids:[6, 8])
disaster.items.create(title: 'Workout Pants', description: "Sizes XS-XXL",
 inventory: 120, price: 30.99, size: '10pk', category_ids:[5])
disaster.items.create(title: "Casimir Sweaters", description: "Sizes XS-XXL",
 inventory: 120, price: 30.99, size: '10pk', category_ids:[5])
disaster.items.create(title: "Casimir Shirt", description: "Sizes XS-XXL",
 inventory: 15, price: 30.99, size: '50pk', category_ids: [5])
disaster.items.create(title: "Casimir Jacket", description: "Size L",
 inventory: 15, price: 30.99, size: '2pk', category_ids:[5])
disaster.items.create(title: "Casimir Socks", description: "Cotton, all sizes",
 inventory: 120, price: 30.99, size: '30pk', category_ids:[5])
disaster.items.create(title: "Casimir Shoes", description: "Sneakers, sizes 5-9",
 inventory: 120, price: 30.99, size: '5pk', category_ids:[5])
disaster.items.create(title: "Casimir Underwear", description: "All types & sizes",
 inventory: 120, price: 30.99, size: '50pk', category_ids:[5])
disaster.items.create(title: "Casimir Generator", description: "Outputs 100v",
 inventory: 120, price: 300.00, size: '1', category_ids:[3, 6])
disaster.items.create(title: "Turing Shirts", description: "Cotton/polyester blend, sizes range 1-9",
   inventory: 150, price: 30.99, size: '32pk', category_ids:[3, 5])

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
