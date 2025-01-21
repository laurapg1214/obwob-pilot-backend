class Question < ApplicationRecord
  ## FIELDS ##
  # default type 0 (text)
  enum type: { text: 0, multiple_choice: 1 }

  ## ASSOCIATIONS ##
  has_and_belongs_to_many :events
  has_many :responses
end
