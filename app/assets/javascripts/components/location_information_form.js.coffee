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

  render: ->
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
            React.DOM.input
              className: 'form-control f-inline'
              type: 'text'
              defaultValue: @props.location.pattern
              ref: 'pattern'
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
            'Interior: '
            React.DOM.input
              className: 'form-control f-inline'
              type: 'text'
              defaultValue: @props.location.interior
              ref: 'interior'
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
            'sale_price: '
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.location.sale_price
              ref: 'sale_price'
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
            'land: '
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.location.land
              ref: 'land'
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
            'construction_size: '
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.location.construction_size
              ref: 'construction_size'
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
            'lot: '
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.location.lot
              ref: 'lot'
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
            'excess: '
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.location.excess
              ref: 'excess'
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
            'over_cost: '
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.location.over_cost
              ref: 'over_cost'
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
            'promo: '
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.location.promo
              ref: 'promo'
          React.DOM.li {className: 'list-group-item'},
            React.DOM.div
            'final_sale_price: '
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.location.final_sale_price
              ref: 'final_sale_price'

          React.DOM.a
            className: 'btn btn-warning'
            onClick: @handleSubmit
            'Update'
          React.DOM.a
            className: 'btn btn-default'
            onClick: @props.handleCancel
            'Cancel'

