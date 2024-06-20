# db/seeds.rb

# Destroy all existing records to start fresh
GardenPlant.destroy_all
Garden.destroy_all
Fertilizer.destroy_all
Plant.destroy_all
User.destroy_all

puts "Destroying all existing records..."

# Seed data for users
user_data = [
  { email: 'test@example.com', password: '123456', username: 'test' },
  { email: 'test1@example.com', password: '123456', username: 'test1' }
]

puts "Creating Users..."

# Seed users with hashed passwords
user_data.each do |data|
  user = User.create!(
    username: data[:username],
    email: data[:email],
    password: data[:password]
  )
  puts "User #{user.username} created!"
end

puts "Users created successfully!"

# Seed data for plants
plants_data = [
  { name: 'Rose', description: 'Beautiful flower', water_amount: 3, bloom: Date.today, weather_preference: 'Sunny', sunlight: 'Full sun', soil_type: 'Well-drained' },
  { name: 'Lily', description: 'Fragrant flower', water_amount: 2, bloom: Date.today, weather_preference: 'Warm', sunlight: 'Partial shade', soil_type: 'Rich' }
]

puts "Creating Plants..."

plants_data.each do |data|
  plant = Plant.create!(
    name: data[:name],
    description: data[:description],
    water_amount: data[:water_amount],
    bloom: data[:bloom],
    weather_preference: data[:weather_preference],
    sunlight: data[:sunlight],
    soil_type: data[:soil_type]
  )
  puts "Plant #{plant.name} created!"
end

puts "Plants created successfully!"

# Seed data for fertilizers
fertilizers_data = [
  { name: 'Nitrogen', description: 'Promotes leafy growth', kind: 'Organic', nutrient_ratio: 'NPK 12-0-0' },
  { name: 'Phosphorus', description: 'Stimulates root development', kind: 'Synthetic', nutrient_ratio: 'NPK 0-12-0' }
]

puts "Creating Fertilizers..."

fertilizers_data.each do |data|
  fertilizer = Fertilizer.create!(
    name: data[:name],
    description: data[:description],
    kind: data[:kind],
    nutrient_ratio: data[:nutrient_ratio]
  )
  puts "Fertilizer #{fertilizer.name} created!"
end

puts "Fertilizers created successfully!"

# Seed data for gardens
gardens_data = [
  { name: 'Rose Garden', location: 'Backyard', size: 10, category: 'Flower', user_id: User.first.id },
  { name: 'Front Garden', location: 'Driveway', size: 40, category: 'Flower', user_id: User.first.id },
  { name: 'Back Garden', location: 'Backyard', size: 100, category: 'Vegetable', user_id: User.first.id },
  { name: 'Vegetable Garden', location: 'Balcony', size: 50, category: 'Vegetable', user_id: User.last.id }
]

puts "Creating Gardens..."

gardens_data.each do |data|
  garden = Garden.create!(
    name: data[:name],
    location: data[:location],
    size: data[:size],
    category: data[:category],
    user_id: data[:user_id]
  )
  puts "Garden #{garden.name} created!"
end

puts "Gardens created successfully!"

# Seed data for garden plants
garden_plants_data = [
  { plant_id: Plant.first.id, garden_id: Garden.first.id, fertilizer_id: Fertilizer.first.id, last_watered: Date.today, last_fertilized: Date.today, health: 80, notes: 'Needs more sunlight' },
  { plant_id: Plant.last.id, garden_id: Garden.last.id, fertilizer_id: Fertilizer.last.id, last_watered: Date.today, last_fertilized: Date.today, health: 90, notes: 'Thriving well' }
]

puts "Creating Garden Plants..."

garden_plants_data.each do |data|
  garden_plant = GardenPlant.create!(
    plant_id: data[:plant_id],
    garden_id: data[:garden_id],
    fertilizer_id: data[:fertilizer_id],
    last_watered: data[:last_watered],
    last_fertilized: data[:last_fertilized],
    health: data[:health],
    notes: data[:notes]
  )
  puts "Garden Plant #{garden_plant.id} created!"
end

puts "Garden Plants created successfully!"
