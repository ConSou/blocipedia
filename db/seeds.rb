require 'faker'

#  Create Users

5.times do

  User.create!(
    email: Faker::Internet.email,
    password: 'password'
  )
end
users = User.all

# Create Wikis

50.times do

  Wiki.create!(
    title: Faker::Hacker.noun,
    body: Faker::Hacker.say_something_smart,
    user: users.sample
  )
end

puts "Seeding finished"
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."
