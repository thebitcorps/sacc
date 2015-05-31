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
      React.DOM.div null,
        label
        value
  showInfo: ->
    React.DOM.div
      className: 'locationInfo'
      React.DOM.div
        className: 'card z-depth-3'
        React.DOM.h2
          className: 'table-title p-20 '
          'Location info'
        React.DOM.div
          className: 'campos white'
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
        React.DOM.div
          className: 'card-action clearfix'
          React.DOM.a
            className: 'btn btn-warning'
            onClick: @handleToggle
            'Edit'



