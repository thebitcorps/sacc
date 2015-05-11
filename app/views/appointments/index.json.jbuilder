json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :client_id, :user_id, :date, :notes, :time, :mood, :interest
  json.url appointment_url(appointment, format: :json)
end
