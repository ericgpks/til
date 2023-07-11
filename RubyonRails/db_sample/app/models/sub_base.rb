class SubBase < ApplicationRecord
  self.abstract_class = true
  establish_connection :sub
end
