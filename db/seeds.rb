User.create(name: 'Developer', paternal_lastname: 'Bit', maternal_lastname: 'Thor',
            password: '12345678', email: 'dev@thebitcorps.com', cellphone: '(449) 123 1234', gender: true)



5.times do
  Client.create(name: 'Juan', paternal_lastname: 'De Las', maternal_lastname: 'Cuerdas', current_salesman_id: 1, gender: true)
end

5.times do
  Client.create(name: 'Diego', paternal_lastname: 'De Las', maternal_lastname: 'Cuerdas', current_salesman_id: 1, gender: true)
end
5.times do
  Client.create(name: 'Zacarias', paternal_lastname: 'De Las', maternal_lastname: 'Cuerdas', current_salesman_id: 1, gender: true)
end