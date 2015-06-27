@Documents = React.createClass
  getInitialState: ->
    dossier: @props.dossier
    edit: false
    selected: null

  getDefaultProps: ->
    dossier: []

  handleToggle: (d_id, e) ->
    e.preventDefault()
    @state.selected = d_id
    @setState edit: true

  handleCancel: (e) ->
    e.preventDefault()
    @setState edit: false

  handleUpdate: (dossier) ->
    @state.dossier = dossier
    @setState edit: false

  renderCheckBoxField: (id, label, value, icon) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.div
        className: 'checkbox'
        React.DOM.label
          className: ''
          React.DOM.input
            type: 'checkbox'
            ref: 'client_' + label.toLowerCase().replace(' ', '_').replace('-', '_')
            defaultChecked: value
            onClick: @handleToggle.bind(this, id)
          React.DOM.i
            className: icon
            style:
              marginRight: '5px'
          label

  showDocuments: (documents) ->
    docLayOut = { 'spouse_ife' : 'IFE ID from spouse', 'spouse_birth_certificate' : 'Birth Certificate form spouse', 'birth_certificate' : 'Birth Certificate', 'residence_proof' : 'Residence Proof', 'ife' : 'IFE ID', 'contract' : 'Contract', 'bank_request' : 'Bank request', 'payroll_bank_statement_1' : 'Payroll bank statement #1', 'payroll_bank_statement_2' : 'Payroll bank statement #2', 'payroll_bank_statement_3' : 'Payroll bank statement #3', 'payroll_receipt_1' : 'Payroll receipt #1', 'payroll_receipt_2' : 'Payroll receipt #2', 'payroll_receipt_3' : 'Payroll receipt #3', 'labor_letter': 'Labor letter', 'fiscal_bank_statement_1' : 'Fiscal bank statement #1', 'fiscal_bank_statement_2' : 'Fiscal bank statement #2', 'fiscal_bank_statement_3' : 'Fiscal bank statement #3', 'revenue_registration' : 'Revenue registration', 'rfc' : 'RFC', 'annual_tax_return' : 'Anual tax return', 'personal_bank_statement_1' : 'Personal bank statement #1', 'personal_bank_statement_2' : 'Personal bank statement #2', 'personal_bank_statement_3' : 'Personal bank statement #3', 'charter' : 'Charter', 'business_rfc' : 'Bisiness RFC', 'business_revenue_registration': 'Business revenue registration', 'business_annual_tax_return' : 'Business annual tax return', 'business_statements' : 'Business statements', 'screen_capture' : 'Screen capture', 'infonavit_request': 'INFONAVIT request', 'work_evidence' : 'Work evidence', 'fovissste_request' : 'FOVISSSTE request'}
    React.DOM.div
      className: 'card'
      React.DOM.div
        className: 'card-header'
        React.DOM.div
          className: 'card-title'
          React.DOM.h1
            className: ''
            "Documents"
      React.DOM.div
        className: 'card-content'
        if documents.length == 0
          React.DOM.ul
            className: 'list-group'
            React.DOM.li
              className: 'list-group-item'
              React.DOM.i
                className: 'md-warning'
                style:
                  marginRight: '5px'
              "The client has no documents. Select the proper credit information."
        else
          for doc in documents
            React.DOM.div
              className: 'col-md-4'
              @renderCheckBoxField(doc.id, docLayOut[doc.title], doc.check, if doc.original then 'md md-book' else 'md md-content-copy')
      React.DOM.div
        className: 'clearfix'
      React.DOM.div
        className: 'card-action clearfix'
        React.DOM.div
          className: 'icon-holder col-sm-6 col-md-6 col-lg-6'
          React.DOM.i
            className: 'md md-book'
            style:
              marginRight: '5px'
          "Original document"
        React.DOM.div
          className: 'icon-holder col-sm-6 col-md-6 col-lg-6'
          React.DOM.i
            className: 'md md-content-copy'
            style:
              marginRight: '5px'
          "Copy of document"

  render: ->
    if @state.edit
      React.createElement DocumentsForm, selected: @state.selected, dossier: @state.dossier, handleCancel: @handleCancel, handleUpdate: @handleUpdate
    else
      @showDocuments(@state.dossier.documents)
