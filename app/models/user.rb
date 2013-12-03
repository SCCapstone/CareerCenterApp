class User < ActiveRecord::Base
	has_many :messages, foreign_key: "to"

	def add_favorite(employer_id)
		self.favorites = [] if self.favorites == nil
  		update_attributes favorites: self.favorites + [employer_id] unless self.favorites.include?(employer_id.to_s)
	end

	def remove_favorite(employer_id)
		update_attributes favorites: self.favorites.delete(employer_id.to_s) unless self.favorites.nil?
	end
end
