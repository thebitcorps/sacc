@BasicClient = React.createClass
  getInitialState: ->
    client: @props.client
    edit: false

  getBirthDateFormated: (date) ->
    if(date == null)
      return "Birthdate not specified"
    months = { '01': 'January', '02': 'February', '03': 'March', '04': 'April', '05': 'May', '06': 'June', '07': 'July', '08': 'August', '09': 'September', '10': 'October', '11': 'November', '12': 'December' }
    ymd = date.split('-')
    birthDate = new Date(ymd[0], ymd[1] - 1, ymd[2])
    today = new Date
    yearsOld = parseInt((today - birthDate) / (1000 * 60 * 60 * 24 * 365), 10)
    ymd[2] + ' ' + months[ymd[1]] + ' ' + ymd[0] + ' (' + yearsOld + ' years old)'

  getEMail: (email) ->
    if(email == null)
      return "Email not specified"
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
    maritals = {'married' : 'Married', 'divorced' : 'Divorced', 'single' : 'Single'}
    if(client.marital_status == null)
      leyend =  "Marital status not specified"
    if(client.marital_status == "married")
      if(client.spouse == '' || client.spouse == null)
        leyend = "Married but the spouse is not especified"
      else
        leyend = "Married with " + client.spouse
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
            React.DOM.a
              className: 'btn btn-primary'
              href: "/appointments/new?client_id=#{client.id}"
              'Make apoitment'
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
          'Edit Information'

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
            "Editing "
            client.fullname
      React.DOM.div
        className: 'card-content'
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-4'
            @renderTextField("Name", client.name, 'client_name')
          React.DOM.div
            className: 'col-md-4'
            @renderTextField("Paternal lastname", client.paternal_lastname, 'client_paternal_lastname')
          React.DOM.div
            className: 'col-md-4'
            @renderTextField("Maternal lastname", client.maternal_lastname, 'client_maternal_lastname')
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'input radio_buttons col-md-4'
            React.DOM.h5
              className: 'radio_buttons'
              "Gender"
            React.DOM.div
              className: 'clearfix'
              @renderRadioField("Male", true,  client.gender, 'client_gender', true, 'client_male')
              @renderRadioField("Female", false, client.gender, 'client_gender', true, 'client_female')
          React.DOM.div
            className: 'col-md-8'
            React.DOM.div
              className: 'col-md-4'
              @renderSelectField("Day", @getElementFromDate(client.birthdate, 2), @getRangeForSelect([1..31]), null, 'client_birthdate_day')
            React.DOM.div
              className: 'col-md-4'
              @renderSelectField("month", @getElementFromDate(client.birthdate, 1), [{'val' : '1', 'dis' : 'January'}, {'val' : '2', 'dis' : 'February'}, {'val' : '3', 'dis' : 'March'}, {'val' : '4', 'dis' : 'April'}, {'val' : '5', 'dis' : 'May'}, {'val' : '6', 'dis' : 'June'}, {'val' : '7', 'dis' : 'July'}, {'val' : '8', 'dis' : 'August'}, {'val' : '9', 'dis' : 'September'}, {'val' : '10', 'dis' : 'October'}, {'val' : '11', 'dis' : 'November'}, {'val' : '12', 'dis' : 'December'}], null, 'client_birthdate_month')
            React.DOM.div
              className: 'col-md-4'
              @renderSelectField("Year", @getElementFromDate(client.birthdate, 0), @getRangeForSelect([1940..1993]), null, 'client_birthdate_year')
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-8'
            @renderTextField("Address", client.address, 'client_address')
          React.DOM.div
            className: 'col-md-4'
            @renderTextField("Zipcode", client.zipcode, 'client_zipcode')
          React.DOM.div
            className: 'col-md-6'
            @renderTextField("Division", client.division, 'client_division')
          React.DOM.div
            className: 'col-md-6'
            @renderTextField("Town", client.town, 'client_town')
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-6'
            @renderSelectField("Current place", client.current_place, [{'val' : 'own', 'dis' : 'Own'}, {'val' : 'rented', 'dis' : 'Rented'}, {'val' : 'family', 'dis' : 'Family'}, {'val' : 'borrowed', 'dis' : 'Borrowed'}, {'val' : 'mortgaged', 'dis' : 'Mortaged'}], null, 'client_current_place')
          React.DOM.div
            className: 'col-md-6'
            @renderTextField("Total income $", client.total_income, 'client_total_income')
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col-md-4'
            @renderSelectField("Marital status", client.marital_status, [{'val' : 'single', 'dis' : 'Sinlge'}, {'val' : 'married', 'dis' : 'Married'}, {'val' : 'divorced', 'dis' : 'Divorced'}], @handleMaritalStatusView, 'client_marital_status')
          React.DOM.div
            className: 'col-md-4'
            @renderSelectField("Offsprings", client.offsprings, [{'val' : '0', 'dis' : '0'}, {'val' : '1', 'dis' : '1'}, {'val' : '2', 'dis' : '2'}, {'val' : '3', 'dis' : '3'}, {'val' : '4', 'dis' : '4'}, {'val' : '5', 'dis' : '5'}, {'val' : '6', 'dis' : '6'}, {'val' : '7', 'dis' : '7'}, {'val' : '8', 'dis' : '8'}, {'val' : '9', 'dis' : '9'}, {'val' : '10', 'dis' : '10'}], null, 'client_offsprings')
          React.DOM.div
            className: 'col-md-4'
            @renderSelectField("Dependents", client.dependents, [{'val' : '0', 'dis' : '0'}, {'val' : '1', 'dis' : '1'}, {'val' : '2', 'dis' : '2'}, {'val' : '3', 'dis' : '3'}, {'val' : '4', 'dis' : '4'}, {'val' : '5', 'dis' : '5'}, {'val' : '6', 'dis' : '6'}, {'val' : '7', 'dis' : '7'}, {'val' : '8', 'dis' : '8'}, {'val' : '9', 'dis' : '9'}, {'val' : '10', 'dis' : '10'}], null, 'client_dependents')
        React.DOM.div
          id: 'spouse-group'
          hidden: if client.marital_status != 'married' then true else false
          React.DOM.div
            className: 'row'
            React.DOM.div
              className: 'col-md-4'
              @renderTextField("Spouse name", client.spouse, 'client_spouse_name')
            React.DOM.div
              className: 'col-md-6'
              React.DOM.div
                className: 'col-md-4'
                @renderSelectField("Day", @getElementFromDate(client.spouse_birthdate, 2), @getRangeForSelect([1..31]), null, 'client_spouse_birthdate_day')
              React.DOM.div
                className: 'col-md-4'
                @renderSelectField("month", @getElementFromDate(client.spouse_birthdate, 1), [{'val' : '1', 'dis' : 'January'}, {'val' : '2', 'dis' : 'February'}, {'val' : '3', 'dis' : 'March'}, {'val' : '4', 'dis' : 'April'}, {'val' : '5', 'dis' : 'May'}, {'val' : '6', 'dis' : 'June'}, {'val' : '7', 'dis' : 'July'}, {'val' : '8', 'dis' : 'August'}, {'val' : '9', 'dis' : 'September'}, {'val' : '10', 'dis' : 'October'}, {'val' : '11', 'dis' : 'November'}, {'val' : '12', 'dis' : 'December'}], null, 'client_spouse_birthdate_month')
              React.DOM.div
                className: 'col-md-4'
                @renderSelectField("Year", @getElementFromDate(client.spouse_birthdate, 0), @getRangeForSelect([1940..1993]), null, 'client_spouse_birthdate_year')
            React.DOM.div
              className: 'col-md-2'
              React.DOM.label
                className: 'control-label'
                " "
              @renderSwitchField("Spouse works", client.spouse_works, 'client_spouse_works')
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'input radio_buttons col-md-6'
            React.DOM.h5
              className: 'radio_buttons'
              "Pathway"
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
              "Sales channel"
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
          'update'
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Cancel'

  render: ->
    client = @state.client
    client['pathWaysArray'] = [{'val' : 'signal', 'dis' : 'Signal'}, {'val' : 'references', 'dis' : 'References'}, {'val' : 'flyers', 'dis' : 'Flyers'}, {'val' : 'billboard', 'dis' : 'Billboard'}, {'val' : 'radio', 'dis' : 'radio'}, {'val' : 'event_activation', 'dis' : 'Event activation'}, {'val' : 'business_prospecting ', 'dis' : 'Business prospecting'}, {'val' : 'email ', 'dis' : 'E-mail'}, {'val' : 'tv ', 'dis' : 'TV'}, {'val' : 'banks ', 'dis' : 'Banks'}, {'val' : 'web_page ', 'dis' : 'Web page'}, {'val' : 'social_networks ', 'dis' : 'Social networks'}]
    client['salesChannelsArray'] = [{'val' : 'point_of_sale', 'dis' : 'Point of sale'}, {'val' : 'business_promo', 'dis' : 'Business promo'}, {'val' : 'activation_point', 'dis' : 'Activation point'}, {'val' : 'references', 'dis' : 'References'}, {'val' : 'brokers', 'dis' : 'Brokers'}]
    if @state.edit
      @renderClientForm(client)
    else
      @renderClientData(client)
