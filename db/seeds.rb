# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
    fake_email = Faker::Name.name
    fake_app_name = Faker::Name.name
    
    User.create!(name: fake_email, password: 'password')
    Event.create!(name: fake_name)
end

puts 'Finished Planting seed'
