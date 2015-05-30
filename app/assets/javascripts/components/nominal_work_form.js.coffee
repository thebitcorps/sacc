@NominalWorkForm = React.createClass
  getDefaultProps: ->
    locationInfo: []

  chooseURL: (recordType)->
    if recordType == 'SpouseWorkRecord'
      'spouse_work_record'
    else
      'nominal_work_record'

  nominalInput: (defaultV,reference,label) ->
    React.DOM.li {className: 'list-group-item'},
      React.DOM.div
      label
      React.DOM.input
        className: 'form-control f-inline'
        type: 'text'
        defaultValue: defaultV
        ref: reference

  handleSubmit: (e) ->
    e.preventDefault()
    data =
      name: React.findDOMNode(@refs.name).value
      address: React.findDOMNode(@refs.address).value
      phone: React.findDOMNode(@refs.phone).value
      extension: React.findDOMNode(@refs.extension).value
      zip_code: React.findDOMNode(@refs.zip_code).value
      position: React.findDOMNode(@refs.position).value
      email: React.findDOMNode(@refs.email).value
      seniority: React.findDOMNode(@refs.seniority).value
      income: React.findDOMNode(@refs.income).value

    $.ajax
      method: 'PUT'
      url: "/" + @chooseURL(@props.nominalWork.type) + "/#{ @props.nominalWork.id }"
      dataType: 'JSON'
      data:
        if @props.nominalWork.type == 'SpouseWorkRecord'
          spouse_work_record: data
        else
          nominal_work_record: data
      success: (data) =>
        @props.handleUpdate data
  render: ->
    React.DOM.div
      className: 'card'
      React.DOM.h2
        className: 'title'
        'Location info'
      React.DOM.ul {className: 'list-group'},
        @nominalInput(@props.nominalWork.name,'name','Name: ')
        @nominalInput(@props.nominalWork.address,'address','Address: ')
        @nominalInput(@props.nominalWork.phone,'phone','Phone: ')
        @nominalInput(@props.nominalWork.extension,'extension','Extension: ')
        @nominalInput(@props.nominalWork.zip_code,'zip_code','Zipcode: ')
        @nominalInput(@props.nominalWork.position,'position','Position: ')
        @nominalInput(@props.nominalWork.email,'email','Email: ')
        @nominalInput(@props.nominalWork.seniority,'seniority','Senority: ')
        @nominalInput(@props.nominalWork.income,'income','Income: ')
      React.DOM.a
        className: 'btn btn-warning'
        onClick: @handleSubmit
        'update'
      React.DOM.a
        className: 'btn btn-default'
        onClick: @props.handleCancel
        'Cancel'