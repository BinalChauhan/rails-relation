$redis_server = "localhost"
$redis_key = ""
$redis_port = "6379"

require 'sidekiq'
require 'sidekiq/web'

Sidekiq.configure_server do |config|
    if Rails.env.development?
        config.redis = { host: $redis_server, :port => $redis_port }
    else
        config.redis = { ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } }
    end
end

Sidekiq.configure_client do |config|
    if Rails.env.development?
        config.redis = { host: $redis_server, :port => $redis_port }
    else
        config.redis = { ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE } }
    end
end
