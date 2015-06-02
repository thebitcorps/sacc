module InteractionsHelper

  def interactions_notes(client)
    client.interactions.map(&:notes)
  end

end
