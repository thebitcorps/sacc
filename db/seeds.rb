User.create(name: 'Developer', paternal_lastname: 'Bit', maternal_lastname: 'Thor',
            password: '12345678', email: 'dev@thebitcorps.com', cellphone: '(449) 123 1234', gender: true)

5.times do |i|
  Client.create(name: "Juan#{i}", paternal_lastname: 'De Las', maternal_lastname: 'Cuerdas', current_salesman_id: 1, gender: true)
  Client.create(name: "Diego#{i}", paternal_lastname: 'De Las', maternal_lastname: 'Cuerdas', current_salesman_id: 1, gender: true)
  Client.create(name: "Gaviota#{i}", paternal_lastname: 'Pena', maternal_lastname: 'Miento', current_salesman_id: 1, gender: false)
end