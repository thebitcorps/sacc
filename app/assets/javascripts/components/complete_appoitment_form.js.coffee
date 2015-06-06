@CompleteAppoitmentForm = React.createClass

  getInitialState: ->
    options: @props.data.options
    selectOptions: @props.data.selectOptions
    message: @props.data.defaultMessage

  showCorrectMessage: (e) ->
    @setState message: @state.selectOptions[e.target.value]
  handleUpdate: (e) ->
    data =
      client_id: @props.data.client_id
      status:  React.findDOMNode(@refs.status).value
      notes: React.findDOMNode(@refs.notes).value
    $.ajax
      method: 'PUT'
      url: "/appointments/#{ @props.data.appointment_id}"
      dataType: 'JSON'
      data:
        appointment: data
      success: (data) =>
        window.location.replace('/clients/' + @props.data.client_id)

  render: ->

    React.DOM.div
      className: 'form-inputs'
      React.DOM.label
        className: 'select optional'
        'Status'
        React.DOM.select
          className: 'form-control'
          name: 'status'
          ref: 'status'
          onChange: @showCorrectMessage
          for option in @state.options
            React.DOM.option null,
              value: option

        React.DOM.h4 null,
          @state.message
        React.DOM.label
         className: 'text optional control-label'
         for: 'appoitment-notes'
         'notes'
        React.DOM.textarea
          className: 'text optional form-control vertical'
          id: 'appoitment-notes'
          name: 'notes'
          ref: 'notes'
        React.DOM.a
          className: 'waves-effect waves-light btn btn-primary btn'
          onClick: @handleUpdate
          'complete'
