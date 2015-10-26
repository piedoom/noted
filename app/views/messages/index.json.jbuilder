json.array!(@messages) do |message|
	#json.extract! message, :id, :body, :user_id, :group_id, :created_at
	json.id message.id
	json.body message.body
	json.created_at message.created_at
end
