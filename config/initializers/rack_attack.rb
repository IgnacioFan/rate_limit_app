module Rack
  class Attack
    throttle_limit = proc { Rails.env.production? ? 60 : 3 }
    period = proc { Rails.env.production? ? 1.minutes : 5.seconds }
    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

    throttle("req/ip", limit: throttle_limit, period: period) do |request|
      request.ip
    end

    self.throttled_responder = lambda do |env|
      [429, {}, ["Too many requests, please retry after 1 minute\n"]]
    end
  end
end
