# default records
@default_facilitator = User.find_or_create_by(role: :facilitator, default_record: true) do |user|
  user.name = 'Facilitator'
end

@default_participant = User.find_or_create_by(role: :participant, default_record: true) do |user|
  user.name = 'Participant'
end

[@default_event.users << @default_facilitator, @default_event.users << @default_participant].each do |user|
  @default_event.users << user unless @default_event.users.include?(user)
end