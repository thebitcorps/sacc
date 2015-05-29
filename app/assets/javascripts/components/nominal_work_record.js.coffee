@NominalWorkRecord = React.createClass
  getInitialState: ->
    nominalWork: @props.data.nominal_work_record
    edit: false
  getDefaultProps: ->
    nominalWork: []

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  updateNominalWork: (nominal)->
    @setState edit: false
    @setState nominalWork: nominal
  nomimalWorkElement: (value,label) ->
    React.DOM.li  {className: 'list-group-item'},
      React.DOM.div
        label
      value

  handleUpdate: (nominal) ->
    @setState edit: false
    @setState nominalWork: nominal
  showNominalWork: ->
    React.DOM.div
      className: 'card'
      React.DOM.h2
        className: 'title'
        'Nominal Work'
      React.DOM.ul {className: 'list-group'},
        @nomimalWorkElement(@state.nominalWork.name,'Name: ')
        @nomimalWorkElement(@state.nominalWork.address,'Address: ')
        @nomimalWorkElement(@state.nominalWork.phone,'phone: ')
        @nomimalWorkElement(@state.nominalWork.extension,'Extension: ')
        @nomimalWorkElement(@state.nominalWork.zip_code,'Zip code: ')
        @nomimalWorkElement(@state.nominalWork.position,'Position: ')
        @nomimalWorkElement(@state.nominalWork.email,'Email: ')
        @nomimalWorkElement(@state.nominalWork.seniority,'Seniority: ')
        @nomimalWorkElement(@state.nominalWork.income,'Income: ')
      React.DOM.a
        className: 'btn btn-warning'
        onClick: @handleToggle
        'Edit'

  render: ->
    React.DOM.div
      className: 'nominalWork'
      React.DOM.div
        className: 'card'
        if @state.edit
          React.createElement NominalWorkForm, nominalWork: @state.nominalWork,handleCancel: @handleToggle,handleUpdate: @handleUpdate
        else
          @showNominalWork()
