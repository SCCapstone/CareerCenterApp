json.array!(@messages) do |message|
  json.extract! message, :to, :from, :from_role, :read, :content
  json.url message_url(message, format: :json)
end
