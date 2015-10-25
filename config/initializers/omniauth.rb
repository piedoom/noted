Rails.application.config.middleware.use OmniAuth::Builder do
	provider :tumblr, ENV['TUMBLR_CONSUMER_KEY'], ENV['TUMBLR_CONSUMER_SECRET']
end
