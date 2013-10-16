json.array!(@conferences) do |conference|
  json.extract! conference, :name, :location, :description, :last_edit
  json.url conference_url(conference, format: :json)
end
