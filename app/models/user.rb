class User < ApplicationRecord
  ## FIELDS ##
  # default role  0 (participant)
  enum :role, { participant: 0, facilitator: 1 }, prefix: true, default: 0
  validates :role, presence: true

  ## ASSOCIATIONS ##
  has_and_belongs_to_many :events
  has_many :responses

  ## CALLBACKS ##
  # set default name before creating user
  before_create :assign_default_name

  # generate uuid in Ruby to allow porting to new db
  before_create :generate_uuid

  ## METHODS ##

  private

  # assign default name based on role
  def assign_default_name
    if role_facilitator?
      self.name ||= 'Facilitator'
    elsif role_participant?
      self.name ||= 'Participant'
    end
  end

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
