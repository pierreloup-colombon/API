# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w{users wristbands roles}.each do |table_name|
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name}")
end

r1 = Role.create(name: 'default')
r2 = Role.create(name: 'admin')

u1 = User.create(email: "nicolas@epitech.eu", password: "plopplop", pin_code: 1, provider: 'default')
u1.uid = u1.email
u1.save!

u2 = User.create(email: "nicolas@gmail.com", password: "plopplop", pin_code: 2, provider: 'default')
u2.uid = u2.email
u2.save!

Wristband.create
Wristband.create
