module ClientsHelper
  def salutation(client)
    if client.spouse
      [client.fullname, client.spouse].join(" / ")
    else
      client.fullname
    end
  end

end
