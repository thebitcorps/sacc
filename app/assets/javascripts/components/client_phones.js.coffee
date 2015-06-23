@ClientPhones = React.createClass
  getInitialState: ->
    phones: @props.phones
    mainPhone: @props.mainPhone
    editablePhones: null
    edit: false

  handleEdit: (e) ->
    e.preventDefault()
    if(!@state.edit)
      @state.editablePhones = @state.phones
    @setState edit: !@state.edit

  getCorrectNumber: (number) ->
    if number < 10
      '0' + number
    else
      number

  getTimeFromDate: (date) ->
    actualDate = new Date(date)
    @getCorrectNumber(actualDate.getHours()) + ":" + @getCorrectNumber(actualDate.getMinutes())

  handleDeletePhone: (id, e) ->
    e.preventDefault()
    for phone in @state.editablePhones
      if phone.id == id
        phone['_destroy'] = true
    row = React.findDOMNode(@refs['phone_row_' + id])
    row.style.display = 'none'



  renderPhones: (phones, main) ->
    phoneKinds = { 'house' : 'md-home', 'cellphone' : 'md-phone-iphone', 'office' : 'md-work', 'other' : 'md md-phone'}
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
          if(phones.length == 0)
            React.DOM.li
              className: 'list-group-item'
              React.DOM.i
                className: 'md-warning'
                style:
                  marginRight: '5px'
              "The client has no phones registered"
          else
            for phone in phones
              React.DOM.li
                className: 'list-group-item'
                React.DOM.i
                  className: phoneKinds[phone.kind]
                  style:
                    marginRight: '5px'
                phone.number
      React.DOM.div
        className: 'card-action clearfix'
        React.DOM.a
          onClick: @handleEdit
          className: 'btn btn-warning pull-right'
          'Edit Phones'

  renderTextField: (id, value) ->
    React.DOM.div
      className: 'form-group string'
      React.DOM.input
        className: 'string form-control'
        type: 'text'
        defaultValue: value
        ref:  'phone_' + id

  renderRadioField: (id, value, name, inline) ->
    React.DOM.div
      className:  if inline then 'radio-inline' else 'radio'
      React.DOM.label
        className: ''
        React.DOM.input
          className: 'radio_buttons'
          type: 'radio'
          name: name
          defaultChecked: value
          ref: 'phone_' + id
        ""

  renderSelectField: (id, value, options) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.select
        className: 'form-control'
        defaultValue: value
        ref: 'phone_' + id
        for option in options
          React.DOM.option
            value: option.val
            option.dis

  renderEditableRow: (phone, main)->
    React.DOM.tr
      className: 'ng-scope'
      ref: 'phone_row_' + phone.id 
      React.DOM.td
        className:'f20 ng-binding'
        @renderRadioField("main_" + phone.id, main && phone.id, "phone_main", false)
      React.DOM.td
        className:'ng-binding'
        @renderSelectField("kind_" + phone.id, phone.kind, [{'val' : 'office', 'dis' : 'Office'}, {'val' : 'house', 'dis' : 'House'}, {'val' : 'cellphone', 'dis' : 'Cellphone'}, {'val' : 'other', 'dis' : 'Other'}])
      React.DOM.td
        className:'ng-binding'
        @renderTextField("number_" + phone.id, phone.number)
      React.DOM.td
        className:'ng-binding'
        @renderTextField("av_from_" + phone.id, @getTimeFromDate(phone.available_from))
      React.DOM.td
        className:'ng-binding'
        @renderTextField("av_to_" + phone.id, @getTimeFromDate(phone.available_to))
      React.DOM.td
        className:'ng-binding'
        React.DOM.a
          className: 'btn btn-round-sm btn-link ng-scope'
          React.DOM.i
            className: 'md md-delete'
            onClick: @handleDeletePhone.bind(this, phone.id)

  renderPhonesForm: (phones, main) ->
    React.DOM.div
      className: 'card'
      React.DOM.div
        className: 'card-header'
        React.DOM.div
          className: 'card-title'
          React.DOM.h1
            className: ''
            "Editing phones"
      React.DOM.table
        className: 'table table-full table-full-small'
        React.DOM.colgroup
          className: ''
          React.DOM.col
            className: 'auto-cell-size p-r-20'
        React.DOM.thead
          className: ''
          React.DOM.tr
            className: ''
            React.DOM.th
              className: ''
              "Main"
            React.DOM.th
              className: ''
              "Kind"
            React.DOM.th
              className: ''
              "Number"
            React.DOM.th
              className: ''
              "Available from"
            React.DOM.th
              className: ''
              "Available to"
            React.DOM.th
              className: ''
              ""
        React.DOM.tbody
          className: ''
          for phone in phones
            @renderEditableRow(phone, main)
      React.DOM.div
        className: 'card-action clearfix'
        React.DOM.a
          className: 'btn btn-warning pull-right'
          'update'
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Cancel'

  render: ->
    if @state.edit
      @renderPhonesForm(@state.phones, @state.mainPhone)
    else
      @renderPhones(@state.phones, @state.mainPhone)
    
