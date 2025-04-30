# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear old data if reseeding
ScheduleShow.destroy_all
Schedule.destroy_all
Show.destroy_all
User.destroy_all

# Users
user1 = User.create!(first_name: "Monty", last_name: "Pfeifer", email: "monty@example.com")
user2 = User.create!(first_name: "Alex", last_name: "Smith", email: "alex@example.com")

# Shows
show1 = Show.create!(artist: "The Foo Fighters", location: "Main Stage", date: Date.today + 1, time: "19:00")
show2 = Show.create!(artist: "Beyoncé", location: "Grand Arena", date: Date.today + 2, time: "21:00")
show3 = Show.create!(artist: "Taylor Swift", location: "Side Stage", date: Date.today + 3, time: "20:00")

# Schedules
schedule1 = Schedule.create!(title: "Monty's Festival Plan", date: Date.today + 1, user: user1)
schedule2 = Schedule.create!(title: "Alex's Festival Adventure", date: Date.today + 2, user: user2)

# ScheduleShows (join)
ScheduleShow.create!(schedule: schedule1, show: show1)
ScheduleShow.create!(schedule: schedule1, show: show2)
ScheduleShow.create!(schedule: schedule2, show: show2)
ScheduleShow.create!(schedule: schedule2, show: show3)
