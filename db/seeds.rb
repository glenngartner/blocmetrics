# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

user = User.new(email: 'admin@admin.com', password: 'password')
user.skip_confirmation!
user.save!

user_id = 1
reg_app_id = 1

25.times do
    fake_app_name = Faker::App.name
    fake_url = Faker::Internet.url
    RegisteredApplication.create!(name: fake_app_name, url: fake_url, user_id: user_id)
    # appGen()

    10.times do
        # eventGen()
        event_name = Faker::Name.name
        Event.create!(name: event_name, registered_application_id: reg_app_id)
    end

    reg_app_id += 1
end

def eventGen
    event_name = Faker::Name.name
    Event.create!(name: event_name, registered_application_id: reg_app_id)
end

def appGen
    fake_app_name = Faker::Name.name
    fake_url = Faker::Internet.url
    RegisteredApplication.create!(name: fake_app_name, url: fake_url, user_id: user_id)
end

puts 'Finished Planting seed'
puts "#{RegisteredApplication.count} Apps created for #{User.first.email}"
puts "#{Event.count} events created"
