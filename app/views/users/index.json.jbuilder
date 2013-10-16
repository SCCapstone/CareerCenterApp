json.array!(@users) do |user|
  json.extract! user, :name, :role, :favorites, :source, :token, :email
  json.url user_url(user, format: :json)
end
