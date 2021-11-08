# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create(email: "1@gmail.com", password: "123")
adv1 = Advance.create(user_id: u1.id, debtor: "empresa1", date: "2017-21-01", invoice_number: 1,advance_per: 2, status: "procesando", final_amount: 123)