json.array!(@wage_check_lists) do |wage_check_list|
  json.extract! wage_check_list, :id, :payroll_statements, :payslips, :labor_letter
  json.url wage_check_list_url(wage_check_list, format: :json)
end
