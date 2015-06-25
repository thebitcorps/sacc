@ClientPhones = React.createClass
  getInitialState: ->
    phones: @props.phones
    client_id: @props.client_id
    editablePhones: null
    newCount: 1
    newDeletedCount: 0
    oldCount: 1
    assignedNewMain: false
    edit: false

  handleEdit: (e) ->
    e.preventDefault()
    if(!@state.edit)
      @state.editablePhones = []
      for phone in @state.phones
        @state.editablePhones.push({'id' : phone.id})
      @state.oldCount = @state.phones.length
      @state.newDeletedCount = 0
      @state.assignedNewMain = false
    @setState edit: !@state.edit

  getCorrectNumber: (number) ->
    if number < 10
      '0' + number
    else
      number

  getTimeFromDate: (date) ->
    actualDate = new Date(date)
    @getCorrectNumber(actualDate.getHours()) + ":" + @getCorrectNumber(actualDate.getMinutes())

  checkSomething: () ->
    if @state.oldCount > 0
      for phone in @state.editablePhones
        if !phone['_destroy']
          React.findDOMNode(@refs['phone_main_' + phone.id]).checked = true
          return
    else
      for num in [1..30]
        if React.findDOMNode(@refs['phone_new_main_' + num]).checked == false && React.findDOMNode(@refs['new_phone_row_' + num]).style.display != 'none'
          React.findDOMNode(@refs['phone_new_main_' + num]).checked = true
          @state.assignedNewMain = true
          return

  handleDeletePhone: (id, e) ->
    e.preventDefault()
    for phone in @state.editablePhones
      if phone.id == id
        phone['_destroy'] = true
    row = React.findDOMNode(@refs['phone_row_' + id])
    row.style.display = 'none'
    @state.oldCount--
    if React.findDOMNode(@refs['phone_main_' + id]).checked
      @checkSomething()

  handleDeleteUnsaved: (id, e) ->
    e.preventDefault()
    row = React.findDOMNode(@refs['new_phone_row_' + id])
    row.style.display = 'none'
    @state.newDeletedCount++
    if @state.newCount == @state.newCount
      @state.assignedNewMain = false
    if React.findDOMNode(@refs['phone_new_main_' + id]).checked
      @checkSomething()

  handleAddNew: (e) ->
    e.preventDefault()
    row = React.findDOMNode(@refs['new_phone_row_' + @state.newCount])
    row.style.display = ''
    if !@state.assignedNewMain && @state.oldCount == 0
      @state.assignedNewMain = true
      React.findDOMNode(@refs['phone_new_main_' + @state.newCount]).checked = true
    @state.newCount++

  getDateString: (dateInput) ->
    hm = dateInput.split(':')
    actualDate = new Date(2000, 1, 1, hm[0], hm[1], 0, 0)
    actualDate.toUTCString()

  handleSubmit: (id, e) ->
    e.preventDefault()
    for phone in @state.editablePhones
      if !phone['_destroy']
        phone['is_main'] = React.findDOMNode(@refs['phone_main_' + phone.id]).checked
        phone['kind'] = React.findDOMNode(@refs['phone_kind_' + phone.id]).value
        phone['number'] = React.findDOMNode(@refs['phone_number_' + phone.id]).value
        phone['available_from'] = @getDateString(React.findDOMNode(@refs['phone_av_from_' + phone.id]).value)
        phone['available_to'] = @getDateString(React.findDOMNode(@refs['phone_av_to_' + phone.id]).value)
    for num in [1..30]
      if React.findDOMNode(@refs['new_phone_row_' + num]).style.display != 'none'
        new_main = React.findDOMNode(@refs['phone_new_main_' + num]).checked
        new_kind = React.findDOMNode(@refs['phone_new_kind_' + num]).value
        new_number = React.findDOMNode(@refs['phone_new_number_' + num]).value
        new_av_from = @getDateString(React.findDOMNode(@refs['phone_new_av_from_' + num]).value)
        new_av_to = @getDateString(React.findDOMNode(@refs['phone_new_av_to_' + num]).value)
        @state.editablePhones.push({'is_main' : new_main, 'kind' : new_kind, 'number' : new_number, 'available_to' : new_av_from, 'available_to' : new_av_to})
    
    $.ajax
      method: 'PUT'
      url: "/clients/#{ id }"
      dataType: 'JSON'
      data:
        client:
          phones_attributes:
            @state.editablePhones
      success: (data) =>
        @state.phones = data.phones
        @setState edit: !@state.edit

  renderPhones: (phones) ->
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

  renderEditableRow: (phone)->
    React.DOM.tr
      className: 'ng-scope'
      ref: 'phone_row_' + phone.id 
      React.DOM.td
        className:'f20 ng-binding'
        @renderRadioField("main_" + phone.id, phone.is_main, "phone_main", false)
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

  renderEditableNewRow: (id)->
    React.DOM.tr
      className: 'ng-scope'
      ref: 'new_phone_row_' + id
      style:
        display: 'none'
      React.DOM.td
        className:'f20 ng-binding'
        @renderRadioField("new_main_" + id, false, "phone_main", false)
      React.DOM.td
        className:'ng-binding'
        @renderSelectField("new_kind_" + id, "", [{'val' : 'office', 'dis' : 'Office'}, {'val' : 'house', 'dis' : 'House'}, {'val' : 'cellphone', 'dis' : 'Cellphone'}, {'val' : 'other', 'dis' : 'Other'}])
      React.DOM.td
        className:'ng-binding'
        @renderTextField("new_number_" + id, "")
      React.DOM.td
        className:'ng-binding'
        @renderTextField("new_av_from_" + id, "")
      React.DOM.td
        className:'ng-binding'
        @renderTextField("new_av_to_" + id, "")
      React.DOM.td
        className:'ng-binding'
        React.DOM.a
          className: 'btn btn-round-sm btn-link ng-scope'
          React.DOM.i
            className: 'md md-delete'
            onClick: @handleDeleteUnsaved.bind(this, id)

  renderPhonesForm: (phones) ->
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
              className:'ng-binding'
              React.DOM.a
                className: 'btn btn-round-sm btn-link ng-scope'
                React.DOM.i
                  className: 'md md-add-circle-outline'
                  onClick: @handleAddNew
        React.DOM.tbody
          className: ''
          for phone in phones
            @renderEditableRow(phone)
          for num in [1..30]
            @renderEditableNewRow(num)
      React.DOM.div
        className: 'card-action clearfix'
        React.DOM.a
          className: 'btn btn-warning pull-right'
          onClick: @handleSubmit.bind(this, @state.client_id)
          'update'
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Cancel'

  render: ->
    if @state.edit
      @renderPhonesForm(@state.phones)
    else
      @renderPhones(@state.phones)
    
