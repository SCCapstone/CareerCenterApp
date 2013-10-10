json.array!(@employers) do |employer|
  json.extract! employer, :name, :website, :description, :majors, :email, :positions, :tips, :created_at, :updated_at, :last_edit, :table_id, :conference_id
  json.url employer_url(employer, format: :json)
end
