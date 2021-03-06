# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'
  config.button_class = 'waves-effect waves-light btn'
  config.boolean_label_class = nil

  config.wrappers :vertical_form, tag: 'div', class: 'input-field', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :input
    b.use :label
    b.use :error, wrap_with: { tag: 'span', class: 'error-block' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  end

  config.wrappers :vertical_boolean, tag: 'p', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.use :input
    b.use :label
    b.use :error, wrap_with: { tag: 'span', class: 'error-block' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: 'p', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly
    b.use :input
    b.use :label
    b.use :error, wrap_with: { tag: 'span', class: 'error-block' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  end

  config.wrappers :inline_checkbox, :tag => 'div', :class => 'control-group', :error_class => 'error' do |b|
    b.use :html5
    b.wrapper :tag => 'div', :class => 'controls' do |ba|
      ba.use :label_input, :wrap_with => { :class => 'checkbox inline' }
      ba.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
      ba.use :hint,  :wrap_with => { :tag => 'p', :class => 'help-block' }
    end
  end

  config.wrappers :checkbox, tag: :div, class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.wrapper tag: :div, class: 'checkbox' do |ba|
      ba.use :input
      ba.use :label_text
    end

    b.use :hint,  wrap_with: { tag: :span, class: "help-block" }
    b.use :error, wrap_with: { tag: :span, class: "error-block" }
  end

  config.wrappers :inline_checkbox, :tag => 'div', :class => 'checkbox', :error_class => 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label_input
  end

  config.wrappers :material_input, tag: 'div', class: 'form-group filled', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :maxlength
    b.optional :readonly
    b.optional :size
    b.use :label, class: 'control-label'
    b.use :input, class: 'form-control'
    b.use :error, wrap_with: { tag: 'span', class: 'error-block' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  end

  config.wrappers :material_text, tag: 'div', class: 'form-group filled', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: 'control-label'
    b.use :input, class: 'form-control vertical'
    b.use :error, wrap_with: { tag: 'span', class: 'error-block' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  end

  config.wrappers :material_time, tag: 'div', class: 'form-group filled', error_class: 'has-error' do |b|
    b.use :html5
    b.use :label, class: 'control-label'
    b.use :input, class: 'form-control', "bs-timepicker" => 'true', "data-autoclose" => '1'
    b.use :error, wrap_with: { tag: 'span', class: 'error-block' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  end

  config.wrappers :material_date, tag: 'div', class: 'form-group filled', error_class: 'has-error' do |b|
    b.use :html5
    b.use :label, class: 'control-label'
    b.use :input, class: 'form-control datepicker'
    b.use :error, wrap_with: { tag: 'span', class: 'error-block' }
    b.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  end

end
