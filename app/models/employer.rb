class Employer < ActiveRecord::Base
  belongs_to :conference
  has_one :table
  before_save :clean_logo

  scope :by_conference, ->(con_id) {where(conference_id: con_id) if con_id}

  private
    def clean_logo
      self.logo = self.logo.original_filename if self.logo.class != String && !self.logo.nil?
    end
end
