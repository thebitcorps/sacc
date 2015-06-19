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

  renderClientForm: (client) ->
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
        React.DOM.div
          className: 'form-group string required client_name filled'
          React.DOM.label
            className: 'string required control-label'
            "Name"
          React.DOM.input
            className: 'string required form-control'
            type: 'text'
            defaultValue: client.name
            ref: 'client_name'

  render: ->
    client = @state.client
    if @state.edit
      @renderClientForm(client)
    else
      @renderClientData(client)
