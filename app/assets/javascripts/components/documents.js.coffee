@Documents = React.createClass
  getInitialState: ->
    documents: @props.data
    edit: false
  getDefaultProps: ->
    documents: []

  documentCheck: (documentCheck) ->
    React.DOM.div
      className: 'checkbox'
      React.DOM.label
        React.DOM.input
          type: 'checkbox'
          defaultChecked: documentCheck.check
          onClick: @handleToggle
        documentCheck.title

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  showDocuments: ->
    React.DOM.div
      className: 'locationInfo'
      React.DOM.div
        className: 'card z-depth-3'
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
          React.createElement DocumentsForm, documents: @state.documents, handleCancel: @handleToggle, handleUpdate: @handleUpdate
        else
          @showDocuments()
