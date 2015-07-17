@DocumentsForm = React.createClass
  getInitialState: ->
    dossier: @props.dossier

  getDefaultProps: ->
    locationInfo: []

  getCheck: (original, d_id) ->
    if d_id == @props.selected
      !original
    else
      original

  handleSubmit: (e) ->
    e.preventDefault()
    dossier_data = {}
    dossier_data['documents_attributes'] = []
    i = 0
    for doc in @state.dossier.documents
      dossier_data['documents_attributes'][i] = {}
      dossier_data['documents_attributes'][i]['id'] = doc.id
      dossier_data['documents_attributes'][i]['check'] = React.findDOMNode(@refs['document_' + doc.id]).checked
      i++

    $.ajax
      method: 'PUT'
      url: "/dossiers/#{ @props.dossier.id }"
      dataType: 'JSON'
      data:
          dossier: dossier_data
      success: (data) =>
        @props.handleUpdate data

  renderCheckBoxField: (id, label, value, icon) ->
    React.DOM.div
      className: 'form-group'
      React.DOM.div
        className: 'checkbox'
        React.DOM.label
          className: ''
          React.DOM.input
            type: 'checkbox'
            ref: 'document_' + id
            defaultChecked: value
          React.DOM.i
            className: icon
            style:
              marginRight: '5px'
          label

  showDocuments: (documents) ->
    docLayOut = { 'spouse_ife' : 'IFE/INE de cónyugue', 'spouse_birth_certificate' : 'Acta de nacimiento de cónyugue', 'birth_certificate' : 'Acta de nacimiento', 'residence_proof' : 'Comprobante de domicilio', 'ife' : 'IFE/INE', 'contract' : 'Contrato', 'bank_request' : 'Solicitud bancaria', 'payroll_bank_statement_1' : 'Estado de cuenta bancaria #1', 'payroll_bank_statement_2' : 'Estado de cuenta bancaria #2', 'payroll_bank_statement_3' : 'Estado de cuenta bancaria #3', 'payroll_receipt_1' : 'Recibo de nómina #1', 'payroll_receipt_2' : 'Recibo de nómina #2', 'payroll_receipt_3' : 'Recibo de nómina #3', 'labor_letter': 'Carta laboral', 'fiscal_bank_statement_1' : 'Estado de cuenta fiscal #1', 'fiscal_bank_statement_2' : 'Estado de cuenta fiscal #2', 'fiscal_bank_statement_3' : 'Estado de cuenta fiscal #3', 'revenue_registration' : 'Comprobante de ingresos', 'rfc' : 'RFC', 'annual_tax_return' : 'Declaración anual de impuestos', 'personal_bank_statement_1' : 'Estado de cuenta personal #1', 'personal_bank_statement_2' : 'Estado de cuenta personal #2', 'personal_bank_statement_3' : 'Estado de cuenta personal #3', 'charter' : 'Charter', 'business_rfc' : 'RFC de empresa', 'business_revenue_registration': 'Comprobante de ingresos de la empresa', 'business_annual_tax_return' : 'Declatación anual de impuestos de la empresa', 'business_statements' : 'Estados de cuenta de la empresa', 'screen_capture' : 'Pantalla curso', 'infonavit_request': 'Solicitud INFONAVIT', 'work_evidence' : 'Constancia de trabajo', 'fovissste_request' : 'Solicitud FOVISSSTE'}
    React.DOM.div
      className: 'card'
      React.DOM.div
        className: 'card-header'
        React.DOM.div
          className: 'card-title'
          React.DOM.h1
            className: ''
            "Editing documents"
      React.DOM.div
        className: 'card-content'
        for doc in documents
          React.DOM.div
            className: 'col-md-4'
            @renderCheckBoxField(doc.id, docLayOut[doc.title], @getCheck(doc.check, doc.id), if doc.original then 'md md-book' else 'md md-content-copy')
      React.DOM.div
        className: 'clearfix'
      React.DOM.div
        className: 'card-action clearfix'
        React.DOM.a
          className: 'btn btn-warning pull-right'
          onClick: @handleSubmit
          'update'
        React.DOM.a
          className: 'btn btn-default'
          onClick: @props.handleCancel
          'Cancel'

  render: ->
    @showDocuments(@state.dossier.documents)