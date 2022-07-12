# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Todo.destroy_all

t1 = Todo.create(title: 'blue', body: 5.67, done: true)
t2 = Todo.create(title: 'green', body: 2.50, done: false)
t3 = Todo.create(title: 'lavender', body: 9.99, done: true)
t4 = Todo.create(title: 'oolong', body: 10.00, done: false)
t5 = Todo.create(title: 'arizona iced', body: 0.99, done: true)