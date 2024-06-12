User.destroy_all
puts "Destroying all users"

user_data = [
  { email: 'test@example.com', password: '123456', username: "test" },
  { email: 'test1@example.com', password: '123456', username: "test1" },
]

# Seed users with hashed passwords
user_data.each do |data|
  user = User.create!(
    username: data[:username],
    email: data[:email],
    password: data[:password]
  )

  puts user.password_digest
end
