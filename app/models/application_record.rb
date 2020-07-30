class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # scope :available, -> { where(deleted_at: nil) }
  # scope :not_hidden, -> { where(status: normal || status: ) }
end
