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
      'InInformación laboral de cónyugue'
    else
      'Información laboral'
  updateNominalWork: (nominal)->
    @setState edit: false
    @setState nominalWork: nominal
  nomimalWorkElement: (value,label) ->
    React.DOM.div null,
      label
      value

  handleUpdate: (nominal) ->
    @setState edit: false
    @setState nominalWork: nominal
  showNominalWork: ->
    React.DOM.div
      className: 'locationInfo'
      React.DOM.div
        className: 'col-sm-6 col-md-6 col-lg-6'
        React.DOM.h2
          className: ''
          @titleSelect(@state.nominalWork.type)
        React.DOM.div
          className: 'form-horizontal'
          @nomimalWorkElement(@state.nominalWork.name,'Nombre: ')
          @nomimalWorkElement(@state.nominalWork.address,'Dirección: ')
          @nomimalWorkElement(@state.nominalWork.phone,'Teléfono: ')
          @nomimalWorkElement(@state.nominalWork.extension,'Extensión: ')
          @nomimalWorkElement(@state.nominalWork.zip_code,'Código postal: ')
          @nomimalWorkElement(@state.nominalWork.position,'Puesto: ')
          @nomimalWorkElement(@state.nominalWork.email,'Email: ')
          @nomimalWorkElement(@state.nominalWork.seniority,'Antogüedad: ')
          @nomimalWorkElement(@state.nominalWork.income,'Ingresos: ')
        React.DOM.div
          className: 'clearfix'
          React.DOM.a
            className: 'btn btn-warning'
            onClick: @handleToggle
            'Editar'

  render: ->
    React.DOM.div
      className: 'nominalWork'
      React.DOM.div
        className: 'card'
        if @state.edit
          React.createElement NominalWorkForm, nominalWork: @state.nominalWork,handleCancel: @handleToggle,handleUpdate: @handleUpdate
        else
          @showNominalWork()
