class Message < ActiveRecord::Base
	include Entangled::Model
	entangle

	belongs_to :group
end
