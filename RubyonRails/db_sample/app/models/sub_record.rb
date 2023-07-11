class SubRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :sub }
end
