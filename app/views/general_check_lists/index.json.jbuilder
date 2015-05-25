json.array!(@general_check_lists) do |general_check_list|
  json.extract! general_check_list, :id, :bank_request, :ife, :address_proof, :birth_certificate
  json.url general_check_list_url(general_check_list, format: :json)
end
