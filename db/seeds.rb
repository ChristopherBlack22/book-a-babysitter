# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Parent.create(first_name: "Test", last_name: "Testson", email: "test@test.com", password: "test")
# Parent.create(first_name: "Bruce", last_name: "Bloke", email: "bruce@test.com", password: "test")

Child.create(name: "Steve", date_of_birth: Time.new(2016,6,5), parent_id: 1) 
Child.create(name: "Sue", date_of_birth: Time.new(2010,9,12), parent_id: 1)
Child.create(name: "Tim", date_of_birth: Time.new(2018,1,15), parent_id: 1)
# Child.create(name: "Jim", age: 5, parent_id: 3)
# Child.create(name: "Harold",age: 4, parent_id: 3)
# Child.create(name: "Debbie",age: 6, parent_id: 3)
# Child.create(name: "Tara",age: 9, parent_id: 3)

Babysitter.create(name: "Mary Poppins", address: "Hush-a-bye Mountain")
Babysitter.create(name: "Mrs Doubtfire", address: "2640 Steiner Street")
Babysitter.create(name: "Maria Kutschera", address: "Big House, Salzburg")
Babysitter.create(name: "Charlie Hilton", address: "Daddy Daycare Centre")
Babysitter.create(name: "James Ubriacco", address: "The Big Apple")

Booking.create(child_id: 1, babysitter_id: 1, start_time: DateTime.new(2021,11,1,18), end_time: DateTime.new(2021,11,1,18)+4.hours, rating: nil)
Booking.create(child_id: 1, babysitter_id: 2, start_time: DateTime.new(2021,11,6,16), end_time: DateTime.new(2021,11,6,16)+10.hours, rating: nil)
Booking.create(child_id: 1, babysitter_id: 1, start_time: DateTime.new(2021,11,10,20), end_time: DateTime.new(2021,11,10,20)+4.hours, rating: nil)
Booking.create(child_id: 1, babysitter_id: 4, start_time: DateTime.new(2021,11,8,21), end_time: DateTime.new(2021,11,8,21)+3.hours, rating: nil)
Booking.create(child_id: 2, babysitter_id: 3, start_time: DateTime.new(2021,11,3,18), end_time: DateTime.new(2021,11,3,18)+4.hours, rating: nil)
Booking.create(child_id: 2, babysitter_id: 3, start_time: DateTime.new(2021,11,7,16), end_time: DateTime.new(2021,11,7,16)+10.hours, rating: nil)
Booking.create(child_id: 2, babysitter_id: 2, start_time: DateTime.new(2021,11,11,20), end_time: DateTime.new(2021,11,11,20)+4.hours, rating: nil)
Booking.create(child_id: 2, babysitter_id: 5, start_time: DateTime.new(2021,11,13,21), end_time: DateTime.new(2021,11,13,21)+3.hours, rating: nil)