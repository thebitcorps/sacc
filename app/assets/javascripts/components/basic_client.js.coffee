@BasicClient = React.createClass
  getInitialState: ->
    client: @props.client
    edit: false

  getFullName: (client) ->
    client.name + " " + client.paternal_lastname + " " + client.maternal_lastname

  getBirthDateFormated: (date) ->
    months = { '01': 'January', '02': 'February', '03': 'March', '04': 'April', '05': 'May', '06': 'June', '07': 'July', '08': 'August', '09': 'September', '10': 'October', '11': 'November', '12': 'December' }
    ymd = date.split('-')
    birthDate = new Date(ymd[0], ymd[1] - 1, ymd[2])
    today = new Date
    yearsOld = parseInt((today - birthDate) / (1000 * 60 * 60 * 24 * 365), 10)
    ymd[2] + ' ' + months[ymd[1]] + ' ' + ymd[0] + ' (' + yearsOld + ' years old)'

  renderStatus: (status) ->
    if status
      classN = 'md md-beenhere'
    else
      classN = 'md md-not-interested'
    React.DOM.i
        className: classN
        style:
          marginLeft: '10px'

  renderClientData: (client) ->
    React.DOM.div
      className: 'card'
      React.DOM.div
        className: 'well white'
        React.DOM.div
          className: 'page-header'
          React.DOM.h1
            className: ''
            @getFullName(client)
            @renderStatus(client.profiled)
            @renderStatus(client.potential)
          React.DOM.div
              className: 'caca'
              @getBirthDateFormated(client.birthdate)

  render: ->
    client = @state.client
    React.DOM.section
      className: 'forms-basic'
      @renderClientData(client)