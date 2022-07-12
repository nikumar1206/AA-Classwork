# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ApplicationRecord.connection.reset_pk_sequence!('cats')
ApplicationRecord.connection.reset_pk_sequence!('cat_rental_requests')

Cat.destroy_all

cat1 = Cat.create({
    name: 'Andrew',
    color: 'green',
    birth_date: '1920/05/20',
    sex: 'M',
    description: 'ugly'
})
cat2 = Cat.create({
    name: 'grumpy_cat',
    color: 'yellow',
    birth_date: '2010/05/20',
    sex: 'F',
    description: 'very grumpy'
})
cat3 = Cat.create({
    name: 'Garfield',
    color: 'ginger',
    birth_date: '2008/03/12',
    sex: 'M',
    description: 'hungry'
})
cat4 = Cat.create({
    name: 'Nyan Cat',
    color: 'black',
    birth_date: '4010/05/20',
    sex: 'F',
    description: 'rainbowy actually'
})

CatRentalRequest.destroy_all
# status: APPROVED, PENDING, DENIED
r1 = CatRentalRequest.create(cat_id: cat1.id, start_date: "20220101", end_date: "20220103", status: "APPROVED")
r2 = CatRentalRequest.create(cat_id: cat1.id, start_date: "20220110", end_date: "20220115", status: "APPROVED")
r3 = CatRentalRequest.create(cat_id: cat1.id, start_date: "20220120", end_date: "20220125", status: "APPROVED")
# r4 = CatRentalRequest.create(cat_id: cat1.id, start_date: "", end_date: "", status: )
# r5 = CatRentalRequest.create(cat_id: cat1.id, start_date: "", end_date: "", status: )