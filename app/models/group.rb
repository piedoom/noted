class Group < ActiveRecord::Base
	include Entangled::Model
	entangle

	has_many :messages
	has_many :conversations
	has_many :users, :through => :conversations
end
