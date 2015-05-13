User.create(name: 'Developer', paternal_lastname: 'Bit', maternal_lastname: 'Thor',
            password: '12345678', email: 'dev@thebitcorps.com', cellphone: '(449) 123 1234', gender: true)



50.times do
  Client.create(name: 'Juan', paternal_lastname: 'De Las', maternal_lastname: 'Cuerdas', current_salesman_id: 1, gender: true)
end