class Event < ApplicationRecord
  ## ASSOCIATIONS ##
  has_and_belongs_to_many :questions
  has_many :responses
  has_and_belongs_to_many :users
end
