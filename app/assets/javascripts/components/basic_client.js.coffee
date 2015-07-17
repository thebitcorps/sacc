@BasicClient = React.createClass
  getInitialState: ->
    client: @props.client
    edit: false

  getBirthDateFormated: (date) ->
    if(date == null)
      return "Fecha de nacimiento no especificada"
    months = { '01': 'Enerp', '02': 'Febrero', '03': 'Marzo', '04': 'Abril', '05': 'Mayo', '06': 'Junio', '07': 'Julio', '08': 'Agosto', '09': 'Septiembre', '10': 'Octubre', '11': 'Noviembre', '12': 'Diciembre' }
    ymd = date.split('-')
    birthDate = new Date(ymd[0], ymd[1] - 1, ymd[2])
    today = new Date
    yearsOld = parseInt((today - birthDate) / (1000 * 60 * 60 * 24 * 365), 10)
    ymd[2] + ' ' + months[ymd[1]] + ' ' + ymd[0] + ' (' + yearsOld + ' years old)'

  getEMail: (email) ->
    if(email == null)
      return "Email no especificado"
    else
      email

  getpathWay: ->
    for pathway in @state.client.pathWaysArray
      if React.findDOMNode(@refs['pathway_' + pathway.val]).checked
        return pathway.val
    null

  getSalesChannel: ->
    for saleschannel in @state.client.salesChannelsArray
      if React.findDOMNode(@refs['sales_channel_' + saleschannel.val]).checked
        return saleschannel.val
    null

  getElementFromDate: (date, num) ->
    if date
      parseInt(date.split('-')[num])
    else
      ""

  renderMaritalStatus: (client) ->
    maritals = {'married' : 'Casado', 'divorced' : 'Divorciado', 'single' : 'Soltero'}
    if(client.marital_status == null)
      leyend =  "Estado civil no especificado"
    if(client.marital_status == "married")
      if(client.spouse == '' || client.spouse == null)
        leyend = "Casado, información de cónyugue no especificada"
      else
        leyend = "Casado con " + client.spouse
    else
      leyend = maritals[client.marital_status]
    React.DOM.li
      className: 'list-group-item'
      React.DOM.i
        className: 'md md-favorite'
        style:
          marginRight: '5px'
      leyend

  handleEdit: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
    #window.scrollTo(0, 0)

  handleSubmit: (id, e) ->
    e.preventDefault()
    data =
      name: React.findDOMNode(@refs.client_name).value
      paternal_lastname: React.findDOMNode(@refs.client_paternal_lastname).value
      maternal_lastname: React.findDOMNode(@refs.client_maternal_lastname).value
      gender: React.findDOMNode(@refs.client_male).checked
      birthdate: React.findDOMNode(@refs.client_birthdate_year).value + '-' + React.findDOMNode(@refs.client_birthdate_month).value  + '-' + React.findDOMNode(@refs.client_birthdate_day).value
      mail: React.findDOMNode(@refs.client_email).value
      marital_status: React.findDOMNode(@refs.client_marital_status).value
      offsprings: React.findDOMNode(@refs.client_offsprings).value
      dependents: React.findDOMNode(@refs.client_dependents).value
      spouse: React.findDOMNode(@refs.client_spouse_name).value
      spouse_works: React.findDOMNode(@refs.client_spouse_works).checked
      spouse_birthdate: React.findDOMNode(@refs.client_spouse_birthdate_year).value + '-' + React.findDOMNode(@refs.client_spouse_birthdate_month).value  + '-' + React.findDOMNode(@refs.client_spouse_birthdate_day).value
      address: React.findDOMNode(@refs.client_address).value
      zipcode: React.findDOMNode(@refs.client_zipcode).value
      division: React.findDOMNode(@refs.client_division).value
      town: React.findDOMNode(@refs.client_town).value
      current_place: React.findDOMNode(@refs.client_current_place).value
      total_income: React.findDOMNode(@refs.client_total_income).value
      pathway: @getpathWay()
      sales_channel: @getSalesChannel()
      which_one_motherfucker: React.findDOMNode(@refs.client_which_one_motherfucker).value

    $.ajax
      method: 'PUT'
      url: "/clients/#{ id }"
      dataType: 'JSON'
      data:
        client:
          data
      success: (data) =>
        @state.client = data
        @setState edit: !@state.edit
      error: (data) =>
        alert ""
        @state.client = data
        @setState edit: !@state.edit

  handleMaritalStatusView: (e) ->
    selected_status = React.findDOMNode(@refs.client_marital_status).value
    if selected_status == 'married'
      $('#spouse-group').show()
    else
      $('#spouse-group').hide()

  handleMotherfuckerView: (view, e) ->
    if view
      $('#motherfucker-group').show()
    else
      $('#motherfucker-group').hide()

  renderClientData: (client) ->
    React.DOM.div
      className: 'card'
      React.DOM.div
        className: 'card-header'
        React.DOM.div
          className: 'card-title'
          React.DOM.h1
            className: ''
            client.fullname 
      React.DOM.div
        className: 'card-content'
        React.DOM.ul
          className: 'list-group'
          React.DOM.li
              className: 'list-group-item'
              React.DOM.i
                className: 'md md-cake'
                style:
                  marginRight: '5px'
              @getBirthDateFormated(client.birthdate)
          React.DOM.li
              className: 'list-group-item'
              React.DOM.i
                className: 'md md-email'
                style:
                  marginRight: '5px'
              @getEMail(client.mail)
          @renderMaritalStatus(client)
      React.DOM.div
        className: 'card-action clearfix'
        React.DOM.a
          onClick: @handleEdit
          className: 'btn btn-warning pull-right'
          'Editar Información'

  renderTextField: (label, value, reference) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.h5
        className: 'control-label'
        label
      React.DOM.input
        className: 'form-control'
        type: 'text'
        defaultValue: value
        ref:  reference

  renderCheckBoxField: (label, value, reference) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.div
        className: 'checkbox'
        React.DOM.label
          React.DOM.input
            type: 'checkbox'
            ref: reference
            defaultChecked: value
          label

  renderSwitchField: (label, value, reference) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.div
        className: 'switch'
        React.DOM.label
          className: 'filled'
          React.DOM.input
            type: 'checkbox'
            ref: reference
            defaultChecked: value
          React.DOM.span
            className: 'lever'
          label

  renderRadioField: (label, value, testvalue, name, inline, reference, onChange) ->
    React.DOM.div
      className:  if inline then 'radio-inline' else 'radio'
      React.DOM.label
        className: ''
        React.DOM.input
          className: 'radio_buttons'
          type: 'radio'
          name: name
          value: value
          onChange: onChange
          defaultChecked: value == testvalue
          ref: reference
        label

  renderSelectField: (label, value, options, onChange, reference) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.h5
        className: 'control-label'
        label
      React.DOM.select
        className: 'form-control'
        onChange: onChange
        defaultValue: value
        ref: reference
        for option in options
          React.DOM.option
            value: option.val
            option.dis

  getCorrectNumber: (number) ->
    if number < 10
      '0' + number
    else
      number

  getRangeForSelect: (range) ->
    outrange = []
    for num in range
      outrange.push {'val' : num, 'dis' : @getCorrectNumber(num)}
    outrange

  renderClientForm: (client) ->
    React.DOM.div
      className: 'card'
      React.DOM.div
        className: 'card-header'
        React.DOM.div
          className: 'card-title'
          React.DOM.h1
            className: ''
            "Editando a "
            client.fullname
      React.DOM.div
        className: 'card-content'
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-4'
            @renderTextField("Nombre", client.name, 'client_name')
          React.DOM.div
            className: 'col-md-4'
            @renderTextField("Apellido paterno", client.paternal_lastname, 'client_paternal_lastname')
          React.DOM.div
            className: 'col-md-4'
            @renderTextField("Apellido materno", client.maternal_lastname, 'client_maternal_lastname')
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'input radio_buttons col-md-4'
            React.DOM.h5
              className: 'radio_buttons'
              "Género"
            React.DOM.div
              className: 'clearfix'
              @renderRadioField("Masculino", true,  client.gender, 'client_gender', true, 'client_male')
              @renderRadioField("Femenino", false, client.gender, 'client_gender', true, 'client_female')
          React.DOM.div
            className: 'col-md-8'
            React.DOM.div
              className: 'col-md-4'
              @renderSelectField("Día", @getElementFromDate(client.birthdate, 2), @getRangeForSelect([1..31]), null, 'client_birthdate_day')
            React.DOM.div
              className: 'col-md-4'
              @renderSelectField("Mes", @getElementFromDate(client.birthdate, 1), [{'val' : '1', 'dis' : 'Enero'}, {'val' : '2', 'dis' : 'Febrero'}, {'val' : '3', 'dis' : 'Marzo'}, {'val' : '4', 'dis' : 'Abril'}, {'val' : '5', 'dis' : 'Mayo'}, {'val' : '6', 'dis' : 'Junio'}, {'val' : '7', 'dis' : 'Julio'}, {'val' : '8', 'dis' : 'Agosto'}, {'val' : '9', 'dis' : 'Septiembre'}, {'val' : '10', 'dis' : 'Octubre'}, {'val' : '11', 'dis' : 'Noviembre'}, {'val' : '12', 'dis' : 'Diciembre'}], null, 'client_birthdate_month')
            React.DOM.div
              className: 'col-md-4'
              @renderSelectField("Año", @getElementFromDate(client.birthdate, 0), @getRangeForSelect([1940..1993]), null, 'client_birthdate_year')
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-8'
            @renderTextField("Dirección", client.address, 'client_address')
          React.DOM.div
            className: 'col-md-4'
            @renderTextField("Código postal", client.zipcode, 'client_zipcode')
          React.DOM.div
            className: 'col-md-6'
            @renderTextField("Colonia", client.division, 'client_division')
          React.DOM.div
            className: 'col-md-6'
            @renderTextField("Ciudad", client.town, 'client_town')
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-6'
            @renderSelectField("Vive en casa...", client.current_place, [{'val' : 'own', 'dis' : 'Propia'}, {'val' : 'rented', 'dis' : 'Rentada'}, {'val' : 'family', 'dis' : 'Familia'}, {'val' : 'borrowed', 'dis' : 'Prestada'}, {'val' : 'mortgaged', 'dis' : 'Hipotecada'}], null, 'client_current_place')
          React.DOM.div
            className: 'col-md-6'
            @renderTextField("Ingresos mensuales $", client.total_income, 'client_total_income')
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-4'
            @renderSelectField("Estado civil", client.marital_status, [{'val' : 'single', 'dis' : 'Soltero'}, {'val' : 'married', 'dis' : 'Casado'}, {'val' : 'divorced', 'dis' : 'Divorciado'}], @handleMaritalStatusView, 'client_marital_status')
          React.DOM.div
            className: 'col-md-4'
            @renderSelectField("Hijos", client.offsprings, [{'val' : '0', 'dis' : '0'}, {'val' : '1', 'dis' : '1'}, {'val' : '2', 'dis' : '2'}, {'val' : '3', 'dis' : '3'}, {'val' : '4', 'dis' : '4'}, {'val' : '5', 'dis' : '5'}, {'val' : '6', 'dis' : '6'}, {'val' : '7', 'dis' : '7'}, {'val' : '8', 'dis' : '8'}, {'val' : '9', 'dis' : '9'}, {'val' : '10', 'dis' : '10'}], null, 'client_offsprings')
          React.DOM.div
            className: 'col-md-4'
            @renderSelectField("Dependientes", client.dependents, [{'val' : '0', 'dis' : '0'}, {'val' : '1', 'dis' : '1'}, {'val' : '2', 'dis' : '2'}, {'val' : '3', 'dis' : '3'}, {'val' : '4', 'dis' : '4'}, {'val' : '5', 'dis' : '5'}, {'val' : '6', 'dis' : '6'}, {'val' : '7', 'dis' : '7'}, {'val' : '8', 'dis' : '8'}, {'val' : '9', 'dis' : '9'}, {'val' : '10', 'dis' : '10'}], null, 'client_dependents')
        React.DOM.div
          id: 'spouse-group'
          hidden: if client.marital_status != 'married' then true else false
          React.DOM.div
            className: 'row'
            React.DOM.div
              className: 'col-md-4'
              @renderTextField("Nombre de cónyugue", client.spouse, 'client_spouse_name')
            React.DOM.div
              className: 'col-md-6'
              React.DOM.div
                className: 'col-md-4'
                @renderSelectField("Día", @getElementFromDate(client.spouse_birthdate, 2), @getRangeForSelect([1..31]), null, 'client_spouse_birthdate_day')
              React.DOM.div
                className: 'col-md-4'
                @renderSelectField("Mes", @getElementFromDate(client.spouse_birthdate, 1), [{'val' : '1', 'dis' : 'Enero'}, {'val' : '2', 'dis' : 'febrero'}, {'val' : '3', 'dis' : 'Marzo'}, {'val' : '4', 'dis' : 'Abril'}, {'val' : '5', 'dis' : 'Mayo'}, {'val' : '6', 'dis' : 'Junio'}, {'val' : '7', 'dis' : 'Julio'}, {'val' : '8', 'dis' : 'Agosto'}, {'val' : '9', 'dis' : 'Septiembre'}, {'val' : '10', 'dis' : 'Octubre'}, {'val' : '11', 'dis' : 'Noviembre'}, {'val' : '12', 'dis' : 'Diciembre'}], null, 'client_spouse_birthdate_month')
              React.DOM.div
                className: 'col-md-4'
                @renderSelectField("Año", @getElementFromDate(client.spouse_birthdate, 0), @getRangeForSelect([1940..1993]), null, 'client_spouse_birthdate_year')
            React.DOM.div
              className: 'col-md-2'
              React.DOM.label
                className: 'control-label'
                " "
              @renderSwitchField("¿Su cónyugue trabaja?", client.spouse_works, 'client_spouse_works')
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'input radio_buttons col-md-6'
            React.DOM.h5
              className: 'radio_buttons'
              "¿Cómo se enteró de nosotros?"
            React.DOM.div
              className: 'clearfix'
              for pathway in client.pathWaysArray
                React.DOM.div
                  className: 'col-md-6'
                  @renderRadioField(pathway.dis, pathway.val, client.pathway, 'client_pathway', true, 'pathway_' + pathway.val)
          React.DOM.div
            className: 'col-md-6'
            React.DOM.h5
              className: 'radio_buttons'
              "Canal de ventas"
            React.DOM.div
              className: 'clearfix'
              for saleschannel in client.salesChannelsArray
                React.DOM.div
                  className: 'col-md-6'
                  @renderRadioField(saleschannel.dis, saleschannel.val, client.sales_channel, 'client_sales_channel', true, 'sales_channel_' + saleschannel.val, @handleMotherfuckerView.bind(this, saleschannel.val == 'activation_point'))
            React.DOM.div
              id: 'motherfucker-group'
              hidden: if client.sales_channel != 'activation_point' then true else false
              @renderTextField('Which one motherfucker', client.which_one_motherfucker, 'client_which_one_motherfucker')
            @renderTextField('E-mail', client.email, 'client_email')
      React.DOM.div
        className: 'card-action clearfix'
        React.DOM.a
          className: 'btn btn-warning pull-right'
          onClick: @handleSubmit.bind(this, client.id)
          'Actualizar'
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Cancelar'

  render: ->
    client = @state.client
    client['pathWaysArray'] = [{'val' : 'signal', 'dis' : 'Señalización'}, {'val' : 'references', 'dis' : 'Referido'}, {'val' : 'flyers', 'dis' : 'Volantes'}, {'val' : 'billboard', 'dis' : 'Cartelera'}, {'val' : 'radio', 'dis' : 'Radio'}, {'val' : 'event_activation', 'dis' : 'Activación de evento'}, {'val' : 'business_prospecting ', 'dis' : 'Prospección empresarial'}, {'val' : 'email ', 'dis' : 'E-mail'}, {'val' : 'tv ', 'dis' : 'TV'}, {'val' : 'banks ', 'dis' : 'Bancos'}, {'val' : 'web_page ', 'dis' : 'Página de Internet'}, {'val' : 'social_networks ', 'dis' : 'Redes sociales'}]
    client['salesChannelsArray'] = [{'val' : 'point_of_sale', 'dis' : 'Punto de venta'}, {'val' : 'business_promo', 'dis' : 'Promoción empresarial'}, {'val' : 'activation_point', 'dis' : 'Activación punto de promoción'}, {'val' : 'references', 'dis' : 'Referidos'}, {'val' : 'brokers', 'dis' : 'Brokers'}]
    if @state.edit
      @renderClientForm(client)
    else
      @renderClientData(client)
