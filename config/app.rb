class App < Configurable # :nodoc:
  # Settings in config/app/* take precedence over those specified here.
  config.name = Rails.application.class.parent.name
  config.repo_root_path = File.join(Rails.root, 'uploads')
  # config.key = "value"
  config.default_host = "gradeual.com"
  config.supported_languages = ["python27"]
  config.language_extensions = {
    "python27" => ".py"
  }
end
