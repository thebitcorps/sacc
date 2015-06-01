@LocationInfoForm = React.createClass
  getDefaultProps: ->
    locationInfo: []
  handleSubmit: (e) ->
    e.preventDefault()
    data =
      pattern: React.findDOMNode(@refs.pattern).value
      interior: React.findDOMNode(@refs.interior).value
      sale_price: React.findDOMNode(@refs.sale_price).value
      land: React.findDOMNode(@refs.land).value
      construction_size: React.findDOMNode(@refs.construction_size).value
      lot: React.findDOMNode(@refs.lot).value
      excess: React.findDOMNode(@refs.excess).value
      over_cost: React.findDOMNode(@refs.over_cost).value
      promo: React.findDOMNode(@refs.promo).value
      final_sale_price: React.findDOMNode(@refs.final_sale_price).value
    $.ajax
      method: 'PUT'
      url: "/location_information/#{ @props.location.id }"
      dataType: 'JSON'
      data:
        location_information: data
      success: (data) =>
        @props.handleUpdate data

  locationInput: (defaultV,reference,label) ->
    React.DOM.div
      className: 'input-group'
      React.DOM.span
        className: 'input-group-addon'
        label
      React.DOM.input
        className: 'form-control'
        type: 'text'
        defaultValue: defaultV
        ref: reference

  render: ->
    React.DOM.div
      className: 'locationInfo'
      React.DOM.div
        className: 'card z-depth-3'
        React.DOM.h2
          className: 'table-title p-20'
          'Location info'
        React.DOM.div
          className: 'well white'
          @locationInput(@props.location.pattern,'pattern','Pattern: ')
          @locationInput(@props.location.interior,'interior','Interior: ')
          @locationInput(@props.location.sale_price,'sale_price','Sale price: ')
          @locationInput(@props.location.land,'land','Land: ')
          @locationInput(@props.location.construction_size,'construction_size','Construction size: ')
          @locationInput(@props.location.lot,'lot','Lot: ')
          @locationInput(@props.location.excess,'excess','Excess: ')
          @locationInput(@props.location.over_cost,'over_cost','Over cost: ')
          @locationInput(@props.location.promo,'promo','Promo: ')
          @locationInput(@props.location.final_sale_price,'final_sale_price','final_sale_price: ')
        React.DOM.div
          className: 'card-action clearfix'
          React.DOM.a
            className: 'btn btn-warning'
            onClick: @handleSubmit
            'Update'
          React.DOM.a
            className: 'btn btn-default'
            onClick: @props.handleCancel
            'Cancel'
