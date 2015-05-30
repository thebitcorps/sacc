module FlashHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

  def b_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :danger  if type == :alert
      type = :danger  if type == :error
      next unless ALERT_TYPES.include?(type)

      tag_class = options.extract!(:class)[:class]

      tag_options = {
        class: "alert alert-dismissible alert-#{type}"
      }.merge(options)

      close_button = content_tag(:button, raw("&times;"),type: 'button', class: "close", "data-dismiss" => 'alert')


      Array(message).each do |msg|
        text = content_tag(:div,  msg.html_safe + close_button , tag_options)
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end