# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'Klaus', paternal_lastname: 'Ruber', maternal_lastname: 'Toe',
            password: '12345678', email: 'klaus@axa.com', cellphone: '(449) 123 1234', gender: true)
