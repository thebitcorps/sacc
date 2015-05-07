json.array!(@users) do |user|
  json.extract! user, :id, :name, :paternal_lastname, :maternal_lastname, :email, :cellphone, :gender
  json.url user_url(user, format: :json)
end
