class User < ActiveRecord::Base
	def self.from_omniauth(auth)
		user = where(auth.slice("provider","uid")).first || create_from_omniauth(auth)
		user.oauth_token = auth["credentials"]["token"]
		user.oauth_secret = auth["credentials"]["secret"]
		user.save!
		user
	end
	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			puts auth.to_yaml
			#auth.name = auth['user_info']['name']
		end
	end
	def tumblr
		@tumblr ||= Tumblr::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
	end
end
