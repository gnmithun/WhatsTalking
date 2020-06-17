# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name:"Kim Il Sung", password:"password")
User.create(name:"Pol Pot", password:"password")
User.create(name:"Kim Jong Un", password:"password")
User.create(name:"Teodoro Obiang", password:"password")
User.create(name:"Kim Jong Il", password:"password")

Message.create(body:"Hello World",user:User.first)
Message.create(body:"I am the supreme leader of North Korea",user:User.first)
Message.create(body:"Death to the imperialists",user:User.first)
Message.create(body:"He He",user:User.second)
Message.create(body:"Welcome Mr Kim",user:User.fourth)
Message.create(body:"Hello to North Korea",user:User.fourth)
Message.create(body:"Hello World",user:User.third)
