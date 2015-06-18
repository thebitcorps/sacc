@ClientView = React.createClass
  getInitialState: ->
    client: @props.client

  getDefaultProps: ->

  render: ->
    React.createElement BasicClient, client: @state.client
