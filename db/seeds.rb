3.times do |i|
  User.create(name: "Developer", paternal_lastname: "Bit #{i}", maternal_lastname: "Thor #{i}",
              password: '12345678', email: "dev#{i}@thebitcorps.com", cellphone: '(449) 123 1234', gender: true)
end
