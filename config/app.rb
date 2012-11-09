class App < Configurable # :nodoc:
  # Settings in config/app/* take precedence over those specified here.
  config.name = Rails.application.class.parent.name

  # config.key = "value"
  config.supported_languages = ["python27"]
end
