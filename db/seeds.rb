admin = User.create(name: "Admin", paternal_lastname: "Bit", maternal_lastname: "Corps",
              password: 'admin123', email: "admin@thebitcorps.com", cellphone: '(449) 123 1234', gender: true)
admin.admin!
3.times do |i|
  User.create(name: "Developer", paternal_lastname: "Bit #{i}", maternal_lastname: "Thor #{i}",
              password: '12345678', email: "dev#{i}@thebitcorps.com", cellphone: '(449) 123 1234', gender: true)
end
