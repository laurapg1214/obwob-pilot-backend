class Event < ApplicationRecord
  ## ASSOCIATIONS ##
  has_and_belongs_to_many :questions
  has_many :answers
  has_and_belongs_to_many :users
end
