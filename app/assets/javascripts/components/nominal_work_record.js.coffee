@NominalWorkRecord = React.createClass
  getInitialState: ->
    nominalWork: @props.data
    edit: false
  getDefaultProps: ->
    nominalWork: []

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  titleSelect: (typeV) ->
    if typeV == 'SpouseWorkRecord'
      'Spouse Work Record'
    else
      'Nominal Work record'
  updateNominalWork: (nominal)->
    @setState edit: false
    @setState nominalWork: nominal
  nomimalWorkElement: (value,label) ->
    React.DOM.tr null,
      React.DOM.td null,
        label
        value

  handleUpdate: (nominal) ->
    @setState edit: false
    @setState nominalWork: nominal
  showNominalWork: ->
    React.DOM.div
      className: 'locationInfo'
      React.DOM.div
        className: 'card z-depth-3'
        React.DOM.h2
          className: 'table-title p-20 '
          @titleSelect(@state.nominalWork.type)
        React.DOM.div
          className: 'table-responsive white'
          React.DOM.table
            className: 'table table-full table-full-small'
            React.DOM.tbody null,
              @nomimalWorkElement(@state.nominalWork.name,'Name: ')
              @nomimalWorkElement(@state.nominalWork.address,'Address: ')
              @nomimalWorkElement(@state.nominalWork.phone,'phone: ')
              @nomimalWorkElement(@state.nominalWork.extension,'Extension: ')
              @nomimalWorkElement(@state.nominalWork.zip_code,'Zip code: ')
              @nomimalWorkElement(@state.nominalWork.position,'Position: ')
              @nomimalWorkElement(@state.nominalWork.email,'Email: ')
              @nomimalWorkElement(@state.nominalWork.seniority,'Seniority: ')
              @nomimalWorkElement(@state.nominalWork.income,'Income: ')
        React.DOM.div
          className: 'card-action clearfix'
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
