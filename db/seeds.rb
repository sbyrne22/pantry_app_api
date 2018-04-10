# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Storage.create([
    {name: 'Refridgerator'},
    {name: 'Freezer'},
    {name: 'Pantry'}
])

Container.create([
    {name: 'Box'},
    {name: 'Can'},
    {name: 'Bag'}
])

10.times do
Food.create(
    name: Faker::Food, purchased_date: Date.parse('2018-04-10'), experation_date: Date.parse('2018-04-17'), storage_id: Faker::Number.rand(1..3), container_id: Faker::Number.rand(1..3)
)
end
