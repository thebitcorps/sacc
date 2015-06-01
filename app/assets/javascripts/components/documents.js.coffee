@Documents = React.createClass
  getInitialState: ->
    documents: @props.data.documents
    edit: false
    selected: 'nu'
  getDefaultProps: ->
    documents: []

  documentCheck: (documentCheck) ->
    React.DOM.div
      className: 'checkbox'
      React.DOM.label
        React.DOM.input
          type: 'checkbox'
          defaultChecked: documentCheck.check
          onClick: @handleToggle.bind(this, documentCheck.id)
        documentCheck.title

  handleToggle: (d_id, e) ->
    e.preventDefault()
    @state.selected = d_id
    @setState edit: true

  handleCancel: (e) ->
    e.preventDefault()
    @setState edit: false

  showDocuments: ->
    React.DOM.div
      className: 'locationInfo'
      React.DOM.div
        className: 'card z-depth-3  well white'
        React.DOM.h2
          className: 'table-title p-20'
          'Documents'
        React.DOM.div
          className: 'card-content'
          for doc in @state.documents
            @documentCheck(doc)

  render: ->
    React.DOM.div
      className: 'documents'
      React.DOM.div
        className: 'card'
        if @state.edit
          React.createElement DocumentsForm, selected: @state.selected, documents: @state.documents, dossierID: @props.data.id, handleCancel: @handleCancel, handleUpdate: @handleUpdate
        else
          @showDocuments()
