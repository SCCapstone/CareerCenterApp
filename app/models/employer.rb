class Employer < ActiveRecord::Base
	belongs_to :conference
	has_one :table
end
