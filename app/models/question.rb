class Question < ApplicationRecord
  ## FIELDS ##
  enum :question_type, { text: 0, multiple_choice: 1 }, prefix: true, default: 0

  ## ASSOCIATIONS ##
  has_and_belongs_to_many :events
  has_many :responses

  ## CALLBACKS ##
  ## v2 ##
  # before_create :set_default_question_type

  # private

  # def set_default_question_type
  #   self.question_type ||= 0
  # end
end
