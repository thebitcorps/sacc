@DocumentsForm = React.createClass
  getInitialState: ->
    documents: @props.documents

  getDefaultProps: ->
    locationInfo: []

  documentCheck: (documentCheck) ->
    React.DOM.div
      className: 'checkbox'
      React.DOM.label
        React.DOM.input
          type: 'checkbox'
          defaultChecked: documentCheck.check
        documentCheck.title

  handleSubmit: (e) ->
    e.preventDefault()

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
        @showDocuments()
        React.DOM.div
          className: 'card-action clearfix'
          React.DOM.a
            className: 'btn btn-warning'
            onClick: @handleSubmit
            'update'
          React.DOM.a
            className: 'btn btn-default'
            onClick: @props.handleCancel
            'Cancel'
