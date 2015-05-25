json.array!(@natural_person_check_lists) do |natural_person_check_list|
  json.extract! natural_person_check_list, :id, :fiscal_statements, :finance_registration, :rfc, :annual_return
  json.url natural_person_check_list_url(natural_person_check_list, format: :json)
end
