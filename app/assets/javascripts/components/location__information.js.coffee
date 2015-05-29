@LocationInfo = React.createClass
  getInitialState: ->
    locationInfo: @props.data.location_information
    edit: false
  getDefaultProps: ->
    locationInfo: []
  handleToggle: (e)->
    e.preventDefault()
    @setState edit: !@state.edit
  updateLocation: (location)->
    @setState edit: false
    @setState locationInfo: location
  render: ->
    if @state.edit
      React.createElement LocationInfoForm, location: @state.locationInfo,handleCancel: @handleToggle,handleUpdate: @updateLocation
    else
      @showInfo()
  showInfo: ->
    React.DOM.div
      className: 'locationInfo'
      React.DOM.div
        className: 'card'
        React.DOM.h2
          className: 'title'
          'Location info'
        React.DOM.ul {className: 'list-group'},
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
              'Pattern: '
            @state.locationInfo.pattern
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
              'Interior: '
            @state.locationInfo.interior
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
              'SalePrice: '
            @state.locationInfo.sale_price
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
              'Land: '
            @state.locationInfo.land
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
              'Construction Size: '
            @state.locationInfo.construction_size
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
              'Lot: '
            @state.locationInfo.lot
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
              'Excess: '
            @state.locationInfo.excess
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
              'Over Price: '
            @state.locationInfo.over_cost
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
              'Promo: '
            @state.locationInfo.promo
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
              'Final Price: '
            @state.locationInfo.final_sale_price
          React.DOM.a
            className: 'btn btn-warning'
            onClick: @handleToggle
            'Edit'



