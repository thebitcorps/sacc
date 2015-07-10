@DatePicker = React.createClass
  componentDidMount: ->
    $('.datepicker').bootstrapMaterialDatePicker({ weekStart : 0, time: false,minDate : new Date() })
  render: ->
    React.DOM.div
      className: 'form-group filled'
      React.DOM.label
        className: 'control-label'
        'Date'
      React.DOM.input
        className: 'form-control datepicker'
        id: @props.id
        type: 'text'
        ngModel: 'date'
        placeholder: 'date'
        ref: @props.reference