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

  renderStatus: (status) ->
    if status
      classN = 'md md-beenhere'
    else
      classN = 'md md-not-interested'
    React.DOM.i
        className: classN
        style:
          marginLeft: '10px'

  renderMaritalStatus: (client) ->
    maritals = {'married' : 'Married', 'divorced' : 'Divorced', 'sigle' : 'Single'}
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
      birthdate: React.findDOMNode(@refs.client_birthdate).value
      #mail: React.findDOMNode(@refs.client_e_mail).value
      marital_status: React.findDOMNode(@refs.client_marital_status).value
      offsprings: React.findDOMNode(@refs.client_offsprings).value
      dependents: React.findDOMNode(@refs.client_dependents).value
      spouse: React.findDOMNode(@refs.client_spouse_name).value
      spouse_works: React.findDOMNode(@refs.client_spouse_works).checked
      spouse_birtdate: React.findDOMNode(@refs.client_spouse_birthdate).value
      address: React.findDOMNode(@refs.client_address).value
      zipcode: React.findDOMNode(@refs.client_zipcode).value
      division: React.findDOMNode(@refs.client_division).value
      town: React.findDOMNode(@refs.client_town).value

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
        @state.client = data
        @setState edit: !@state.edit

  handleMaritalStatusView: (e) ->
    selected_status = React.findDOMNode(@refs.client_marital_status).value
    if selected_status == 'married'
      $('#spouse-group').show()
    else
      $('#spouse-group').hide()

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
          'Edit Information'

  renderTextField: (label, value, reference) ->
    React.DOM.div
      className: 'form-group string'
      React.DOM.label
        className: 'string control-label'
        label
      React.DOM.input
        className: 'string form-control'
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

  renderRadioField: (label, value, name, inline, reference) ->
    React.DOM.div
      className:  if inline then 'radio-inline' else 'radio'
      React.DOM.label
        className: ''
        React.DOM.input
          className: 'radio_buttons'
          type: 'radio'
          name: name
          defaultChecked: value
          ref: reference
        label

  renderSelectField: (label, value, options, onChange, reference) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.label
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
            React.DOM.label
              className: 'radio_buttons'
              "Gender"
            React.DOM.div
              className: 'clearfix'
              @renderRadioField("Male", client.gender, 'client_gender', true, 'client_male')
              @renderRadioField("Female", !client.gender, 'client_gender', true, 'client_female')
          React.DOM.div
            className: 'col-md-8'
            @renderTextField("Birthdate", client.birthdate, 'client_birthdate')
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
            className: 'col-md-4'
            @renderSelectField("Marital status", client.marital_status, [{'val' : 'single', 'dis' : 'Sinlge'}, {'val' : 'married', 'dis' : 'Married'}, {'val' : 'divorced', 'dis' : 'Divorced'}], @handleMaritalStatusView, 'client_marital_status')
          React.DOM.div
            className: 'col-md-4'
            @renderSelectField("Offsprings", client.offsprings, [{'val' : '0', 'dis' : '0'}, {'val' : '1', 'dis' : '1'}, {'val' : '2', 'dis' : '2'}, {'val' : '3', 'dis' : '3'}, {'val' : '4', 'dis' : '4'}, {'val' : '5', 'dis' : '5'}, {'val' : '6', 'dis' : '6'}, {'val' : '7', 'dis' : '7'}, {'val' : '8', 'dis' : '8'}, {'val' : '9', 'dis' : '9'}, {'val' : '10', 'dis' : '10'}], @handleMaritalStatusView, 'client_offsprings')
          React.DOM.div
            className: 'col-md-4'
            @renderSelectField("Dependents", client.dependents, [{'val' : '0', 'dis' : '0'}, {'val' : '1', 'dis' : '1'}, {'val' : '2', 'dis' : '2'}, {'val' : '3', 'dis' : '3'}, {'val' : '4', 'dis' : '4'}, {'val' : '5', 'dis' : '5'}, {'val' : '6', 'dis' : '6'}, {'val' : '7', 'dis' : '7'}, {'val' : '8', 'dis' : '8'}, {'val' : '9', 'dis' : '9'}, {'val' : '10', 'dis' : '10'}], @handleMaritalStatusView, 'client_dependents')
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
              @renderTextField("Spouse birthdate", client.spouse_birtdate, 'client_spouse_birthdate')
            React.DOM.div
              className: 'col-md-2'
              React.DOM.label
                className: 'control-label'
                " "
              @renderSwitchField("Spouse works", client.spouse_works, 'client_spouse_works')
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
    if @state.edit
      @renderClientForm(client)
    else
      @renderClientData(client)
