class User < ActiveRecord::Base
	has_many :messages, foreign_key: "to"

	def add_favorite(employer_id)
		self.favorites = [] if self.favorites == nil
		if self.favorites.include?(employer_id.to_s)
			return nil
		else
  			update_attributes favorites: self.favorites + [employer_id]
  			return true
  		end
	end

	def remove_favorite(employer_id)
		if !self.favorites.nil? && (self.favorites.include?(employer_id.to_s) || self.favorites.include?(employer_id))
			update_attributes favorites: self.favorites - [employer_id, employer_id.to_s]
			return true
		else
  			return nil
  		end
	end
end
