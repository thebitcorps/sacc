@ClientView = React.createClass
  getInitialState: ->
    client: @props.client
    phones: @props.phones
    dossier: @props.dossier

  getDefaultProps: ->

  render: ->
    React.DOM.div
      className: 'row'
      React.createElement BasicClient, client: @state.client
      React.createElement ClientPhones, phones: @state.phones, client_id: @state.client.id
      React.createElement Documents, dossier: @state.dossier, client: @state.client
