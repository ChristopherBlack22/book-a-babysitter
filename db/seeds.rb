# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Parent.create(first_name: "Katy", last_name: "Tomlin", email: "katy@test.com", password: "test")
# Parent.create(first_name: "Bruce", last_name: "Bloke", email: "bruce@test.com", password: "test")

# Child.create(name: "Steve", age: 7, parent_id: 2)
# Child.create(name: "Sue", age: 12, parent_id: 2)
# Child.create(name: "Tim", age: 15, parent_id: 2)
# Child.create(name: "Jim", age: 5, parent_id: 3)
# Child.create(name: "Harold",age: 4, parent_id: 3)
# Child.create(name: "Debbie",age: 6, parent_id: 3)
# Child.create(name: "Tara",age: 9, parent_id: 3)

Babysitter.create(name: "Mary Poppins",age: 35, address: "Hush-a-bye Mountain")
Babysitter.create(name: "Mrs Doubtfire",age: 71, address: "2640 Steiner Street")
Babysitter.create(name: "Maria Kutschera",age: 27, address: "Big House, Salzburg")
Babysitter.create(name: "Charlie Hilton",age: 32, address: "Daddy Daycare Centre")
Babysitter.create(name: "James Ubriacco",age: 36, address: "The Big Apple")

Booking.create(child_id: 1, babysitter_id: 1, start_time: DateTime.now, end_time: DateTime.now+1.days, rating: nil)
Booking.create(child_id: 1, babysitter_id: 2, start_time: DateTime.now+2.days, end_time: DateTime.now+3.days, rating: nil)
Booking.create(child_id: 1, babysitter_id: 1, start_time: DateTime.now+4.days, end_time: DateTime.now+5.days, rating: nil)
Booking.create(child_id: 1, babysitter_id: 4, start_time: DateTime.now-2.days, end_time: DateTime.now-1.days, rating: nil)