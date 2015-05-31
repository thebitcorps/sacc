module AppointmentsHelper
  def today_helper
    date = today_lambda.call
    date.strftime("%A, %b %d") # final format for spanish would be "nombre_del_dia, dia de mes"
  end

  def today_lambda
    -> {Date.today}
  end
end
