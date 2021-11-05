# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Parent.create(first_name: "Test", last_name: "McTesterson", email: "test@test.com", password: "test")
# Parent.create(first_name: "Bruce", last_name: "Bloke", email: "bruce@test.com", password: "test")

Child.create(name: "Steve", age: 05/06/2016, parent_id: 1) 
Child.create(name: "Sue", age: 12/09/2010, parent_id: 1)
Child.create(name: "Tim", age: 15/01/2018, parent_id: )
# Child.create(name: "Jim", age: 5, parent_id: 3)
# Child.create(name: "Harold",age: 4, parent_id: 3)
# Child.create(name: "Debbie",age: 6, parent_id: 3)
# Child.create(name: "Tara",age: 9, parent_id: 3)

Babysitter.create(name: "Mary Poppins",age: 35, address: "Hush-a-bye Mountain")
Babysitter.create(name: "Mrs Doubtfire",age: 71, address: "2640 Steiner Street")
Babysitter.create(name: "Maria Kutschera",age: 27, address: "Big House, Salzburg")
Babysitter.create(name: "Charlie Hilton",age: 32, address: "Daddy Daycare Centre")
Babysitter.create(name: "James Ubriacco",age: 36, address: "The Big Apple")

Booking.create(child_id: 1, babysitter_id: 1, start_time: DateTime.new(2021,11,1,18), end_time: DateTime.new(2021,11,1,18)+4.hours, rating: nil)
Booking.create(child_id: 1, babysitter_id: 2, start_time: DateTime.new(2021,11,6,16), end_time: DateTime.new(2021,11,6,16)+10.hours, rating: nil)
Booking.create(child_id: 1, babysitter_id: 1, start_time: DateTime.new(2021,11,10,20), end_time: DateTime.new(2021,11,10,20)+4.hours, rating: nil)
Booking.create(child_id: 1, babysitter_id: 4, start_time: DateTime.new(2021,11,8,21), end_time: DateTime.new(2021,11,8,21)+3.hours, rating: nil)
Booking.create(child_id: 2, babysitter_id: 3, start_time: DateTime.new(2021,11,3,18), end_time: DateTime.new(2021,11,3,18)+4.hours, rating: nil)
Booking.create(child_id: 2, babysitter_id: 3, start_time: DateTime.new(2021,11,7,16), end_time: DateTime.new(2021,11,7,16)+10.hours, rating: nil)
Booking.create(child_id: 2, babysitter_id: 2, start_time: DateTime.new(2021,11,11,20), end_time: DateTime.new(2021,11,11,20)+4.hours, rating: nil)
Booking.create(child_id: 2, babysitter_id: 5, start_time: DateTime.new(2021,11,13,21), end_time: DateTime.new(2021,11,13,21)+3.hours, rating: nil)