class User < ApplicationRecord
  # default 0 (participant)
  enum role: { participant: 0, facilitator: 1 }
  validates :role, presence: true

  # set default name before creating user
  before_create :assign_default)name

  # generate uuid in Ruby to allow porting to new db
  before_create :generate_uuid

  private

  # assign default name based on role
  def assign_default_naeme
    if facilitator?
      self.name ||= 'Facilitator'
    elseif participant?
      self.name ||= 'Participant'
    end
  end

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
