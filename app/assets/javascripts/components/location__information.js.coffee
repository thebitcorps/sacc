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
  locationInfoDiv: (value,label) ->
      React.DOM.li {className: 'list-group-item'},
        React.DOM.div
          label
        value
  showInfo: ->
    React.DOM.div
      className: 'locationInfo'
      React.DOM.div
        className: 'card'
        React.DOM.h2
          className: 'title'
          'Location info'
        React.DOM.ul {className: 'list-group'},
          @locationInfoDiv(@state.locationInfo.pattern,'Pattern: ')
          @locationInfoDiv(@state.locationInfo.interior,'Interior: ')
          @locationInfoDiv(@state.locationInfo.sale_price,'Saleprice: ')
          @locationInfoDiv(@state.locationInfo.land,'Land: ')
          @locationInfoDiv(@state.locationInfo.construction_size,'Contruccion size: ')
          @locationInfoDiv(@state.locationInfo.lot,'lot: ')
          @locationInfoDiv(@state.locationInfo.excess,'Excess: ')
          @locationInfoDiv(@state.locationInfo.over_cost,'Over cost: ')
          @locationInfoDiv(@state.locationInfo.promo,'Promo: ')
          @locationInfoDiv(@state.locationInfo.final_sale_price,'FInal price: ')
        React.DOM.a
          className: 'btn btn-warning'
          onClick: @handleToggle
          'Edit'



