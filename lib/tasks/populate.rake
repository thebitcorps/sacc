namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'
    [EmploymentRecord, Dossier, Client, Phone, Message, Appointment].each(&:delete_all)

    200.times do |fakey|
      Client.create(name: Faker::Name.first_name, paternal_lastname: Faker::Name.last_name, maternal_lastname: Faker::Name.last_name, current_salesman_id: [1,2,3].sample, gender: [true, false].sample, marital_status: ["single", "married", "widowed", "divorced"].sample, birthdate: Faker::Date.between(50.years.ago, 18.years.ago))
    end

    Client.all.each do |client|
      client.phones.create(number: Faker::PhoneNumber.cell_phone, kind: ['casa', 'oficina', 'celular', 'otro'].sample, available_from: Time.now, available_to: 4.hours.from_now)
    end
  end
end