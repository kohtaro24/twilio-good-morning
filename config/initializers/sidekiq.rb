# frozen_string_literal: true
Sidekiq.configure_server do |config|
  config.redis = { url: Settings.sidekiq.endpoint }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Settings.sidekiq.endpoint }
end
