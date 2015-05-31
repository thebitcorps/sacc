class Dossier < ActiveRecord::Base
  belongs_to :client
  has_one :nominal_work_record, dependent: :destroy
  has_one :spouse_work_record, dependent: :destroy
  has_one :location_information, dependent: :destroy
  has_many :documents, dependent: :destroy

  GENERAL_SPOUSE_BANK_CREDIT_CHECKLIST = {birth_certificate: true, residence_proof: false, ife: false, contract: true, bank_request: true, spouse_ife: false, spouse_birth_cretificate: false}
  NATURAL_BY_WAGE_PERSON_BANK_CREDIT_CHECKLIST = {birth_certificate: true, residence_proof: false, ife: false, contract: true, bank_request: true, payroll_bank_statement_1: false, payroll_bank_statement_2: false, payroll_bank_statement_3: false, payroll_receipt_1: false, payroll_receipt_2: false, payroll_receipt_3: false, labor_letter: true}
  NATURAL_PERSON_BANK_CREDIT_CHECKLIST = {birth_certificate: true, residence_proof: false, ife: false, contract: true, bank_request: true, fiscal_bank_statement_1: false, fiscal_bank_statement_2: false, fiscal_bank_statement_3: false, revenue_registration: false, rfc: false, annual_tax_return: false}
  LEGAL_PERSON_BANK_CREDIT_CHECKLIST = {birth_certificate: true, residence_proof: false, ife: false, contract: true, bank_request: true, fiscal_bank_statement_1: false, fiscal_bank_statement_2: false, fiscal_bank_statement_3: false, personal_bank_statement_1: false, personal_bank_statement_2: false, personal_bank_statement_3: false, charter: false, rfc: false, business_rfc: false, revenue_registration: false, business_revenue_registration: false, annual_tax_return: false, business_annual_tax_return: false, bussines_statements: true}
  INFONAVIT_CHECK_LIST = {birth_certificate: true, residence_proof: false, ife: false, contract: true, screen_capture: false, infonavit_request: true}
  FOVISSSTE_CHECK_LIST = {birth_certificate: true, residence_proof: false, ife: false, contract: true, work_evidence: true, fovissste_request: true}

end
