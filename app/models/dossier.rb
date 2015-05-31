class Dossier < ActiveRecord::Base
  belongs_to :client
  has_one :nominal_work_record, dependent: :destroy
  has_one :spouse_work_record, dependent: :destroy
  has_one :location_information, dependent: :destroy
  has_many :documents, dependent: :destroy

  GENERAL_SPOUSE_BANK_CREDIT_CHECKLIST = {spouse_ife: false, spouse_birth_cretificate: false}
  NATURAL_BY_WAGE_PERSON_BANK_CREDIT_CHECKLIST = {birth_certificate: true, residence_proof: false, ife: false, contract: true, bank_request: true, payroll_bank_statement_1: false, payroll_bank_statement_2: false, payroll_bank_statement_3: false, payroll_receipt_1: false, payroll_receipt_2: false, payroll_receipt_3: false, labor_letter: true}
  NATURAL_PERSON_BANK_CREDIT_CHECKLIST = {birth_certificate: true, residence_proof: false, ife: false, contract: true, bank_request: true, fiscal_bank_statement_1: false, fiscal_bank_statement_2: false, fiscal_bank_statement_3: false, revenue_registration: false, rfc: false, annual_tax_return: false}
  LEGAL_PERSON_BANK_CREDIT_CHECKLIST = {birth_certificate: true, residence_proof: false, ife: false, contract: true, bank_request: true, fiscal_bank_statement_1: false, fiscal_bank_statement_2: false, fiscal_bank_statement_3: false, personal_bank_statement_1: false, personal_bank_statement_2: false, personal_bank_statement_3: false, charter: false, rfc: false, business_rfc: false, revenue_registration: false, business_revenue_registration: false, annual_tax_return: false, business_annual_tax_return: false, bussines_statements: true}
  INFONAVIT_CHECK_LIST = {birth_certificate: true, residence_proof: false, ife: false, contract: true, screen_capture: false, infonavit_request: true}
  FOVISSSTE_CHECK_LIST = {birth_certificate: true, residence_proof: false, ife: false, contract: true, work_evidence: true, fovissste_request: true}

  def make_checklist(credit, entity, consider_spouse)
    if credit == 'bank'
      make_and_dispose(NATURAL_BY_WAGE_PERSON_BANK_CREDIT_CHECKLIST) if entity == 'wage'
      make_and_dispose(NATURAL_PERSON_BANK_CREDIT_CHECKLIST) if entity == 'natural'
      make_and_dispose(LEGAL_PERSON_BANK_CREDIT_CHECKLIST) if entity == 'legal'
    end
    make_and_dispose(INFONAVIT_CHECK_LIST) if credit == 'infonavit'
    make_and_dispose(FOVISSSTE_CHECK_LIST) if credit == 'fovissste'
    if consider_spouse
      make_married
    else
      dispose_merried
    end
  end

  private

    def make_married
      spouse_documents = GENERAL_SPOUSE_BANK_CREDIT_CHECKLIST.keys
      spouse_documents.each do |key|
        document = documents.where(title: key)
        documents.create(title: key, original: GENERAL_SPOUSE_BANK_CREDIT_CHECKLIST[key]) if document.empty?
      end
    end

    def dispose_merried
      spouse_documents = GENERAL_SPOUSE_BANK_CREDIT_CHECKLIST.keys
      spouse_documents.each do |key|
        document = documents.where(title: key)
        documents.destroy(document) if document
      end
    end

    def make_and_dispose(new_documents)
      already = documents.pluck(:title)
      to_make = new_documents.keys.map {|s| s.to_s}
      spouse_keep = already & GENERAL_SPOUSE_BANK_CREDIT_CHECKLIST.keys.map {|s| s.to_s}
      keep = (already & to_make) | spouse_keep
      get_rid = already - keep
      get_add = to_make - keep
      get_rid.each do |title|
        document = documents.where(title: title)
        documents.destroy(document)
      end
      get_add.each do |key|
        documents.create(title: key, original: new_documents[key.to_sym])
      end
    end

end
