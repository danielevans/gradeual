App.configure do
  # Settings specified here will take precedence over those in config/app.rb
  config.repo_root_path = File.join(Rails.root, 'tmp/test_uploads')
  # config.key = "value"
  config.sandbox_server = "localhost:8080"
end
