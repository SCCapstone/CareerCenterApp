class User < ActiveRecord::Base
	has_many :messages, foreign_key: "to"
end
