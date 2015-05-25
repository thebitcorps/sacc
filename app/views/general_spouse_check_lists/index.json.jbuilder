json.array!(@general_spouse_check_lists) do |general_spouse_check_list|
  json.extract! general_spouse_check_list, :id, :marriage_certificate, :ife, :birth_certificate
  json.url general_spouse_check_list_url(general_spouse_check_list, format: :json)
end
