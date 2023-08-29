class Comment < ApplicationRecord
  # Validations
  validates :day, presence: true, uniqueness: true
end
