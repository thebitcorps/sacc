#we need the client id to make the post work
@Interaction = React.createClass
  getInitialState: ->
    interactions: @props.interactions
    edit: false
  getDefaultProps: ->
    locationInfo: []
  getTimeFromDate: (date) ->
    actualDate = new Date(date)
    @getCorrectNumber(actualDate.getHours()) + ":" + @getCorrectNumber(actualDate.getMinutes())
  getCorrectNumber: (number) ->
    if number < 10
      '0' + number
    else
      number

  handleAddNew: (e) ->
    e.preventDefault()
    @setState edit: true
  handleCreate: (e) ->
    e.preventDefault()
    data =
      kind: React.findDOMNode(@refs.kind).value
      date: React.findDOMNode(@refs.date).value
      time: React.findDOMNode(@refs.time).value
      mood: React.findDOMNode(@refs.mood).value
      interest: React.findDOMNode(@refs.interest).value
      notes: React.findDOMNode(@refs.notes).value
      client_id:  @props.client_id
    interactions = @state.interactions.slice()
    $.ajax
      method: 'POST'
      url: '/interactions'
      dataType: 'JSON'
      data:
        interaction: data
      success: (data) =>
        interactions.unshift data
        @setState interactions: interactions
        @setState edit: false
  handleCancel: (e) ->
    e.preventDefault()
    @setState edit: false

  renderSelectField: (reference,value, options) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.select
        className: 'form-control'
        defaultValue: value
        ref: reference
        for option in options
          React.DOM.option
            value: option.val
            option.dis
  renderTextField: (reference) ->
    React.DOM.div
      className: 'form-group string'
      React.DOM.input
        className: 'string form-control'
        type: 'text'
        ref:  reference
  renderNumericalSelect: (from,to,reference) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.select
        className: 'form-control'
        defaultValue: 1
        ref: reference
        for i in [from..to]
          React.DOM.option
            value: i
            i

  makeInteractionIcon: (type) ->
    icons = {'Phone':'md-phone','Module':' md-business', 'House':' md-home', 'Appoitment':'md-adjust', 'Other':'md-adjust'}
    colors = {'Phone':' green','Module':' teal', 'House':' orange', 'Appoitment':' red', 'Other':' yellow'}
    React.DOM.i
      className: 'md darken-1 icon-color ' + icons[type] + colors[type]
  interactionColumn: (interaction) ->
    React.DOM.tr null,
      React.DOM.td 'f20',@makeInteractionIcon interaction.kind
      React.DOM.td null,interaction.kind
      React.DOM.td null,interaction.date
      React.DOM.td null, @getTimeFromDate(interaction.time)
      React.DOM.td null,interaction.mood
      React.DOM.td null,interaction.interest
      React.DOM.td null,interaction.notes

  render: ->
    React.DOM.div
      className: 'card'
      React.DOM.div
        className: 'card-header'
        React.DOM.div
          className: 'card-title'
          React.DOM.h1
            className: ''
            "Interactions"
              React.DOM.a
                className: 'btn btn-round-sm btn-link ng-scope'
                React.DOM.i
                  className: 'md md-add-circle-outline'
                  onClick: @handleAddNew
      React.DOM.div
        className: 'card-content'
        React.DOM.table
          className: 'table table-full table-full-small'
          React.DOM.thead null,
            React.DOM.tr null,
              if @state.edit
                for head in ['Kind','Date','Hour','Mood','Interest','Notes']
                  React.DOM.th null,head
              else
                for head in ['','Kind','Date','Hour','Mood','Interest','Notes']
                  React.DOM.th null,head
          React.DOM.tbody null,
            if @state.edit
              React.DOM.tr null,
                React.DOM.td null, @renderSelectField('kind','Phone',[{'val' : 'Phone', 'dis' : 'Phone'}, {'val' : 'Module', 'dis' : 'Module'}, {'val' : 'House', 'dis' : 'House'}, {'val' : 'Appoitment', 'dis' : 'Appoitment'}, {'val' : 'Other', 'dis' : 'Other'}])
                for input in ['date','time','mood','interest','notes']
                  if input == 'mood' or input == 'interest'
                    React.DOM.td null, @renderNumericalSelect(1,10,input)
                  else
                    React.DOM.td null, @renderTextField(input)

                React.DOM.td null,
                  React.DOM.div
                    className: 'btn-group'
                    React.DOM.a
                      className: 'btn btn-warning'
                      onClick: @handleCreate
                      'Create'
                    React.DOM.a
                      className: 'btn btn-default'
                      onClick: @handleCancel
                      'Cancel'
            for interaction in @state.interactions
              @interactionColumn interaction

