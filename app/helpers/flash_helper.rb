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

      color = type == :success ? 'green' : 'red'
      tag_class = options.extract!(:class)[:class]

      tag_options = {
        class: "alert fade in alert-#{type} #{tag_class} card-panel #{color} lighten-5 z-depth-1 #{color}-text  text-lighten-2"
      }.merge(options)

      close_button = content_tag(:button, raw("&times;"), class: "close right",onclick: "dismiss()")


      Array(message).each do |msg|
        text = content_tag(:div,  msg.html_safe + close_button , tag_options)
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end