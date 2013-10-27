class Table < ActiveRecord::Base
	belongs_to :conference
	has_one :employer
end
