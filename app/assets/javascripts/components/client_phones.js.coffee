@ClientPhones = React.createClass
  getInitialState: ->
    phones: @props.phones
    mainPhone: @props.mainPhone
    edit: false

  renderPhones: (phones, main) ->
    React.DOM.div
      className: 'card'
      React.DOM.div
        className: 'card-header'
        React.DOM.div
          className: 'card-title'
          React.DOM.h1
            className: ''
            "Phones"
      React.DOM.div
        className: 'card-content'
        React.DOM.ul
          className: 'list-group'
          if(phones == null)
            React.DOM.li
              className: 'list-group-item'
              React.DOM.i
                className: 'md md-phone'
                style:
                  marginRight: '5px'
              "Phone not specified"
          else
            for phone in phones
              if phone.id == main
                classKind = 'md md-quick-contacts-dialer'
              else
                classKind = 'md md-phone'
              React.DOM.li
                className: 'list-group-item'
                React.DOM.i
                  className: classKind
                  style:
                    marginRight: '5px'
                phone.number

  render: ->
    @renderPhones(@state.phones, @state.mainPhone)
