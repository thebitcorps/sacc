module AppointmentsHelper
  def today_helper
    date = today_lambda.call
    date.strftime("%A, %b %d") # final format for spanish would be "nombre_del_dia, dia de mes"
  end

  def no_appoitments_messages(type_list)
    if type_list
      hash = {'today' => 'No appointments today', 'upcoming' => 'No future appointments', 'all' => 'No appointments yet', 'previous' => 'There are mo previous appointments'}
      hash[type_list]
    else
      'No appoitments today'
    end
  end

  def today_lambda
    -> {Date.today}
  end

  def placeholder_decorator(object, option)
    o = option.downcase
    if object && !object.new_record?
      object.send(o).nil? ? o : object.send(o).to_s
    else
      o
    end
  end

end
