json.array!(@clients) do |client|
  json.extract! client, :id, :first_name, :paternal_name, :maternal_name, :curp, :imss, :spouse, :birthdate, :mail, :income, :notes, :workplace, :current_salesman_id
  json.url client_url(client, format: :json)
end
