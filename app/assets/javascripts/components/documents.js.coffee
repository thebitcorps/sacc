@Documents = React.createClass
  getInitialState: ->
    client: @props.client
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

  handleCreditChange: ->
    React.findDOMNode(@refs.credit_inf_area).hidden = false

  handleCreditCancel: ->
    React.findDOMNode(@refs.credit_inf_area).hidden = true
    React.findDOMNode(@refs.client_type).value = @state.client.credit_type
    React.findDOMNode(@refs.client_fiscal_entity).value = @state.client.fiscal_entity

  handleSubmit: (id, e) ->
    e.preventDefault()
    data =
      credit_type: React.findDOMNode(@refs.client_type).value
      fiscal_entity: React.findDOMNode(@refs.client_fiscal_entity).value

    $.ajax
      method: 'PUT'
      url: "/credit?id=#{ id }"
      dataType: 'JSON'
      data:
        client:
          data
      success: (documents) =>
        @state.dossier.documents = documents
        @state.client.credit_type = data.credit_type
        @state.client.fiscal_entity = data.fiscal_entity
        React.findDOMNode(@refs.credit_inf_area).hidden = true
        @forceUpdate()

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

  renderSelectField: (label, value, options, onChange) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.label
        className: 'control-label'
        label
      React.DOM.select
        className: 'form-control'
        onChange: onChange
        defaultValue: value
        ref: 'client_' + label.toLowerCase().replace(' ', '_').replace('-', '_')
        for option in options
          React.DOM.option
            value: option.val
            option.dis

  showDocuments: (documents, client) ->
    docLayOut = { 'spouse_ife' : 'IFE ID from spouse', 'spouse_birth_certificate' : 'Birth Certificate form spouse', 'birth_certificate' : 'Birth Certificate', 'residence_proof' : 'Residence Proof', 'ife' : 'IFE ID', 'contract' : 'Contract', 'bank_request' : 'Bank request', 'payroll_bank_statement_1' : 'Payroll bank statement #1', 'payroll_bank_statement_2' : 'Payroll bank statement #2', 'payroll_bank_statement_3' : 'Payroll bank statement #3', 'payroll_receipt_1' : 'Payroll receipt #1', 'payroll_receipt_2' : 'Payroll receipt #2', 'payroll_receipt_3' : 'Payroll receipt #3', 'labor_letter': 'Labor letter', 'fiscal_bank_statement_1' : 'Fiscal bank statement #1', 'fiscal_bank_statement_2' : 'Fiscal bank statement #2', 'fiscal_bank_statement_3' : 'Fiscal bank statement #3', 'revenue_registration' : 'Revenue registration', 'rfc' : 'RFC', 'annual_tax_return' : 'Anual tax return', 'personal_bank_statement_1' : 'Personal bank statement #1', 'personal_bank_statement_2' : 'Personal bank statement #2', 'personal_bank_statement_3' : 'Personal bank statement #3', 'charter' : 'Charter', 'business_rfc' : 'Bisiness RFC', 'business_revenue_registration': 'Business revenue registration', 'business_annual_tax_return' : 'Business annual tax return', 'business_statements' : 'Business statements', 'screen_capture' : 'Screen capture', 'infonavit_request': 'INFONAVIT request', 'work_evidence' : 'Work evidence', 'fovissste_request' : 'FOVISSSTE request'}
    React.DOM.div
      className: 'card'
      React.DOM.div
        className: 'card-header'
        React.DOM.div
          className: 'card-title'
          React.DOM.h1
            className: ''
            "Credit / Documents"
      React.DOM.div
        className: 'card-content'
        React.DOM.span
          className: 'card-title'
          "Credit"
        React.DOM.p
          className: ''
          ""
        React.DOM.div
          className: 'col-md-6'
          @renderSelectField("Type", client.credit_type, [{ 'val' : 'bank', 'dis' : 'Bancario' }, { 'val' : 'infonavit', 'dis' : 'INFONAVIT' }, {'val' : 'fovissste', 'dis' : 'FOVISSSTE'}], @handleCreditChange)
        React.DOM.div
          className: 'col-md-6'
          @renderSelectField("Fiscal entity", client.fiscal_entity, [{ 'val' : 'wage', 'dis' : 'Persona Asalariada' }, { 'val' : 'natural', 'dis' : 'Persona Fisica' }, {'val' : 'legal', 'dis' : 'Persona Moral'}], @handleCreditChange)
        React.DOM.div
          className: ''
          ref: 'credit_inf_area'
          hidden: true
          React.DOM.a
            className: 'btn btn-warning pull-right'
            onClick: @handleSubmit.bind(this, client.id)
            'update'
          React.DOM.a
            className: 'btn btn-default'
            onClick: @handleCreditCancel
            'Cancel'
        React.DOM.div
          className: 'clearfix'
        React.DOM.span
          className: 'card-title'
          "Documents"
        React.DOM.p
          className: ''
          ""
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
          documents.sort (docA, docB) ->
            docA.id - docB.id
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
      @showDocuments(@state.dossier.documents, @state.client)
