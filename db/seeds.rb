# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w{users wristbands roles events shops products}.each do |table_name|
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name}")
end

r1 = Role.create(name: 'default')
r2 = Role.create(name: 'admin')

u1 = User.create(email: "nicolas@epitech.eu", password: "plopplop", pin_code: 1, provider: 'email')
u1.uid = u1.email
u1.save!

u2 = User.create(email: "nicolas@gmail.com", password: "plopplop", pin_code: 2, provider: 'email')
u2.uid = u2.email
u2.save!

Wristband.create
Wristband.create

2.times { |u|
    Event.create(name: "event #{u}", description: "description event #{u}", date: Time.at(rand * Time.now.to_f))
}

u = 1
s1 = Shop.create(name: "event #{u}", description: "description shop #{u}", event_id: u + 1, owner_id: 1)
u = 2
s2 = Shop.create(name: "event #{u}", description: "description shop #{u}", event_id: u + 1, owner_id: 2)

u = 1
p1 = Product.create(name: "product #{u}", description: "description product #{u}", quantity: 0, price: 5.50, shop_id: 1)
u = 2
p2 = Product.create(name: "product #{u}", description: "description product #{u}", quantity: 0, price: 5.50, shop_id: 2)
