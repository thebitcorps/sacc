3.times do |i|
  User.create(name: "Developer", paternal_lastname: "Bit #{i}", maternal_lastname: "Thor #{i}",
              password: '12345678', email: "dev#{i}@thebitcorps.com", cellphone: '(449) 123 1234', gender: true)
end

5.times do |i|
  Client.create(name: "Juan #{i}", paternal_lastname: 'De Las', maternal_lastname: 'Cuerdas', current_salesman_id: [1,2,3].sample, gender: true)
  Client.create(name: "Diego #{i}", paternal_lastname: 'De Las', maternal_lastname: 'Cuerdas', current_salesman_id: [1,2,3].sample, gender: true)
  Client.create(name: "Gaviota #{i}", paternal_lastname: 'Pena', maternal_lastname: 'Miento', current_salesman_id: [1,2,3].sample, gender: false)
end