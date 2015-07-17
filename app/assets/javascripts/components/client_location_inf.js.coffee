@ClientLocationInf = React.createClass
  getInitialState: ->
    houses: @props.houses
    client_id: @props.client_id
    slectedHouse: @props.selectedHouse
    flip: false

  getDefaultProps: ->

  handleHouseChange:->


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
            value: option.id
            option.prototype + " " + option.interior

  render: ->
    React.DOM.div
      className: 'row'
      @renderSelectField("Casa", @state.selectedHouse, @state.houses, @handleHouseChange, "client_house")

