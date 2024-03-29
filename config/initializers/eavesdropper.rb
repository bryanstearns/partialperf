
class Eavesdropper < ActiveSupport::LogSubscriber
  def process_action(event)
    File.open("log/#{Rails.env}.#{event.payload[:action]}.samples", 'a') do |f|
      f.puts event.payload[:view_runtime]
    end unless event.payload[:action] == 'index'
  end
end

Eavesdropper.attach_to :action_controller
