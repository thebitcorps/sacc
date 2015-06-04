module ClientsHelper
  def name_decorator(client)
    if client.spouse && !client.spouse.blank?
      [client.fullname, client.spouse].join(" / ")
    else
      client.fullname
    end
  end

  def status_helper(client)
    client.profiled? ? "md-beenhere" : " md-not-interested"
  end

  def has_dossier_helper(client)
    client.dossier.nil? ? "md-assignment-late" : "md-assignment-turned-in"
  end
end
