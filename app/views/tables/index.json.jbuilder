json.array!(@tables) do |table|
  json.extract! table, :num, :conference_id, :employer_id, :last_edit
  json.url table_url(table, format: :json)
end
