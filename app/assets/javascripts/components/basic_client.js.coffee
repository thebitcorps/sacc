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
      if(client.spouse == null)
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

  handleSubmit: (id, e) ->
    e.preventDefault()
    data =
      name: React.findDOMNode(@refs.client_name).value
      paternal_lastname: React.findDOMNode(@refs.client_paternal_lastname).value
      maternal_lastname: React.findDOMNode(@refs.client_maternal_lastname).value
      gender: React.findDOMNode(@refs.client_male).checked
      birthdate: React.findDOMNode(@refs.client_birthdate).value
      mail: React.findDOMNode(@refs.client_e_mail).value
      profiled: React.findDOMNode(@refs.client_profiled).checked
      potential: React.findDOMNode(@refs.client_potential).checked

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
            @renderStatus(client.profiled)
            @renderStatus(client.potential)
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

  renderTextField: (label, value) ->
    React.DOM.div
      className: 'form-group string filled'
      React.DOM.label
        className: 'string control-label'
        label
      React.DOM.input
        className: 'string form-control'
        type: 'text'
        defaultValue: value
        ref:  'client_' + label.toLowerCase().replace(' ', '_').replace('-', '_')

  renderCheckBoxField: (label, value) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.div
        className: 'checkbox'
        React.DOM.label
          React.DOM.input
            type: 'checkbox'
            ref: 'client_' + label.toLowerCase().replace(' ', '_').replace('-', '_')
            defaultChecked: value
          label

  renderSwitchField: (label, value) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.div
        className: 'switch'
        React.DOM.label
          className: 'filled'
          React.DOM.input
            type: 'checkbox'
            ref: 'client_' + label.toLowerCase().replace(' ', '_').replace('-', '_')
            defaultChecked: value
          React.DOM.span
            className: 'lever'
          label

  renderRadioField: (label, value, name, inline) ->
    React.DOM.div
      className:  if inline then 'radio-inline' else 'radio'
      React.DOM.label
        className: ''
        React.DOM.input
          className: 'radio_buttons'
          type: 'radio'
          name: name
          defaultChecked: value
          ref: 'client_' + label.toLowerCase().replace(' ', '_').replace('-', '_')
        label

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
        @renderSwitchField("Profiled", client.profiled)
        @renderSwitchField("Potential", client.potential)
        @renderTextField("Name", client.name)
        @renderTextField("Paternal lastname", client.paternal_lastname)
        @renderTextField("Maternal lastname", client.maternal_lastname)
        React.DOM.div
          className: 'input radio_buttons'
          React.DOM.label
            className: 'radio_buttons'
            "Gender"
          React.DOM.div
            className: 'clearfix'
            @renderRadioField("Male", client.gender, 'client_gender', true)
            @renderRadioField("Female", !client.gender, 'client_gender', true)
        @renderTextField("Birthdate", client.birthdate)
        @renderTextField("E-Mail", client.mail)
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
