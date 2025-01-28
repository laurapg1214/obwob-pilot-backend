class User < ApplicationRecord
  ## FIELDS ##
  # default role  0 (answerer)
  enum :role, { answerer: 0, asker: 1 }, prefix: true, default: 0
  validates :role, presence: true

  ## ASSOCIATIONS ##
  has_and_belongs_to_many :events
  has_many :answers

  ## CALLBACKS ##
  # set default name before creating user
  before_create :assign_default_name

  # generate uuid in Ruby to allow porting to new db
  before_create :generate_uuid

  ## METHODS ##

  private

  # assign default name based on role
  def assign_default_name
    # ensure working with numeric value of enum
    case role_before_type_cast
    when 1
      self.name ||= 'Asker'
    when 0
      self.name ||= 'Answerer'
    end
  end

  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
