class Conference < ActiveRecord::Base
	has_many :tables
	has_many :employers
end
