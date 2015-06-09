@CompleteAppoitmentForm = React.createClass

  getInitialState: ->
    options: @props.data.options
    selectOptions: @props.data.selectOptions
    message: @props.data.defaultMessage
    dateTimeFields: false
  showCorrectMessage: (e) ->
    @setState message: @state.selectOptions[e.target.value]

    if e.target.value == 'rescheduled'
      @setState dateTimeFields: true
    else
      @setState dateTimeFields: false
  createTimeAndDate: ->
      React.DOM.label
        className: 'text optional control-label'
        for: 'appoitment-notes'
        'Date'

  handleCancel: (e) ->
    window.location.replace('/appointments/')
  dataWithOrWitoutDate: ->
    data =
      client_id: @props.data.client_id
      status:  React.findDOMNode(@refs.status).value
      notes: React.findDOMNode(@refs.notes).value
#    could be better but i dont know how it works
    if @state.dateTimeFields
      data =
        client_id: @props.data.client_id
        status:  React.findDOMNode(@refs.status).value
        notes: React.findDOMNode(@refs.notes).value
        date: React.findDOMNode(@refs.date).value
        time: React.findDOMNode(@refs.time).value
    return data
  handleUpdate: (e) ->
    data = @dataWithOrWitoutDate()

    $.ajax
      method: 'PUT'
      url: "/appointments/#{ @props.data.appointment_id}"
      dataType: 'JSON'
      data:
        appointment: data
      success: (data) =>
        if @state.dateTimeFields
          window.location.replace('/appointments?type_list=upcoming')
        else
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
#        make then work with materialize date pickers
        if @state.dateTimeFields
          React.DOM.div null,
            React.DOM.input
              className: 'string required form-control ng-pristine ng-valid ng-touched'
              name: 'date'
              type: 'text'
              ref: 'date'
            React.DOM.input
              className: 'string required form-control ng-pristine ng-valid ng-touched'
              name: 'time'
              type: 'text'
              ref: 'time'
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
        React.DOM.a
          className: 'waves-effect waves-light btn btn-primary btn'
          onClick: @handleCancel
          'Cancel'
