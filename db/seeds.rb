# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w{users wristbands}.each do |table_name|

    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name}")

end

u1 = User.create(email: "nicolas@epitech.eu", password: "plopplop")
u1.token = 1
u1.save!

u2 = User.create(email: "nicolas@gmail.com", password: "plopplop")
u2.token = 2
u2.save!

Wristband.create
Wristband.create
