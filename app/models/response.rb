class Response < ApplicationRecord
  ## ASSOCIATIONS ##
  belongs_to :event
  belongs_to :question
  belongs_to :user
end
