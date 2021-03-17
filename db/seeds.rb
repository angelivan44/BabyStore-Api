# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(username:"angel", password:"123456" , role:"admin")
user2 = User.create(username:"angel2", password:"123456")
firstClothe = Clothe.new(name:"falda")
secondClothe = Clothe.new(name:"camisa")
thirthClothe = Clothe.new(name:"pantalon")
p "aaaaaaaaaa"
firstClothe.images.attach(io: File.open('app/assets/images/camisa.jpeg'), filename: 'camisa.jpeg')
p firstClothe.errors

secondClothe.images.attach(io: File.open('app/assets/images/falda.jpeg'), filename: 'falda.jpeg')
thirthClothe.images.attach(io: File.open('app/assets/images/pantalon.jpg'), filename: 'pantalon.jpg')
firstClothe.images.attach(io: File.open('app/assets/images/pantalon.jpg'), filename: 'pantalon.jpg')



oneCategory = Category.create(name:"fitness")
secondCategory = Category.create(name:"casual")
thirthCategory = Category.create(name:"verano")

oneCategory.cover.attach(io: File.open('app/assets/images/camisa.jpeg'), filename: 'camisa.jpeg')
secondCategory.cover.attach(io: File.open('app/assets/images/camisa.jpeg'), filename: 'camisa.jpeg')
thirthCategory.cover.attach(io: File.open('app/assets/images/falda.jpeg'), filename: 'falda.jpeg')


firstClothe.category = oneCategory
secondClothe.category = secondCategory
thirthClothe.category = thirthCategory

firstClothe.save()
secondClothe.save()
thirthClothe.save()