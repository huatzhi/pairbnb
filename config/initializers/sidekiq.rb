Sidekiq.configure_server do |config|
  # config.redis = { url: 'redis://localhost:6379/0', namespace: "app3_sidekiq_#{Rails.env}" }
  config.redis = { url: ENV['REDIS_URL'], namespace: "app3_sidekiq_#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  # config.redis = { url: 'redis://localhost:6379/0', namespace: "app3_sidekiq_#{Rails.env}" }
  config.redis = { url: ENV['REDIS_URL'], namespace: "app3_sidekiq_#{Rails.env}" }
end