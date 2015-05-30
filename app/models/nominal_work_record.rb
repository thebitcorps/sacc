class NominalWorkRecord < EmploymentRecord
  def as_json options={}
    {
        id: id,
        name: name,
        address: address,
        phone: phone,
        extension: extension,
        zip_code: zip_code,
        position: position,
        email: email,
        seniority: seniority,
        income: income,
        type: type,
        created_at: created_at,
        updated_at: updated_at
    }
  end
end