

SmokeSignalClient::Alert.site = "#{Rails.configuration.smoke_signal_protocol}://#{Rails.configuration.smoke_signal_url}:#{Rails.configuration.smoke_signal_port}/"
SmokeSignalClient::Alert.password = Rails.configuration.smoke_signal_token
SmokeSignalClient::AlertType.site = "#{Rails.configuration.smoke_signal_protocol}://#{Rails.configuration.smoke_signal_url}:#{Rails.configuration.smoke_signal_port}/"
SmokeSignalClient::AlertType.password = Rails.configuration.smoke_signal_token
SmokeSignalClient::Constraint.site = "#{Rails.configuration.smoke_signal_protocol}://#{Rails.configuration.smoke_signal_url}:#{Rails.configuration.smoke_signal_port}/"
