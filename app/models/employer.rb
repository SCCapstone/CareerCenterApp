class Employer < ActiveRecord::Base
	belongs_to :conference
	has_one :table

  scope :by_conference, ->(con_id) {where(conference_id: con_id) if con_id}
end
