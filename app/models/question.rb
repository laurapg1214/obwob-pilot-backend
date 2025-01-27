class Question < ApplicationRecord
  ## FIELDS ##
  enum :question_type, { text: 0, multiple_choice: 1, emoji: 2 }, prefix: true, default: 0
  EMOJI_VALUES = { 5 => "😄", 4 => "🙂", 3 => "😐", 2 => "🙁", 1 => "😞" }

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
