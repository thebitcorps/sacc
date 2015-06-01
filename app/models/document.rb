class Document < ActiveRecord::Base
  belongs_to :dossier

  def as_json options={}
    {
        id: id,
        title: title,
        attatchment: attatchment,
        original: original,
        check: check,
        created_at: created_at,
        updated_at: updated_at
    }
  end
end
