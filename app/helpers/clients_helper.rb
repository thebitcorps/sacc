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
    client.dossier.nil? ? "md-remove" : "md-done"
  end

  def client_dossier_decorator(client)
    if !client.dossier.nil?
      link_to client.dossier do
        content_tag(:i, nil, :class => "md md-done")
      end
    end
  end
end
