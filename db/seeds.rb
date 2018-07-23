# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'faker'
#
# 10.times do |i|
#   Review.create(
#
#     hospital_id: 1,
#     user_id: 1,
#     title: Faker::OnePiece.quote,
#     comment:Faker::OnePiece.quote,
#     like: 0,
#     star: 0
#   )
# end

require 'csv'
CSV.foreach(Rails.root.join('db', 'hospital.csv'), {headers: true, encoding: "UTF-8"}) do |row|
  Hospital.create!(row.to_hash)
end
