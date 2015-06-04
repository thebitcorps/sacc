module ClientsHelper
  def name_decorator(client)
    if client.spouse && !client.spouse.blank?
      [client.fullname, client.spouse].join(" / ")
    else
      client.fullname
    end
  end

end
