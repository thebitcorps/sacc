json.array!(@legal_person_check_lists) do |legal_person_check_list|
  json.extract! legal_person_check_list, :id, :business_statements, :personal_statements, :charter, :personal_rfc, :business_rfc, :business_finance_registration_boolean, :personal_finance_registration, :annual_return, :financial_statements
  json.url legal_person_check_list_url(legal_person_check_list, format: :json)
end
