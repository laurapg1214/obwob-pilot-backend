# default records
@default_asker = User.find_or_create_by(role: :asker, default_record: true) do |user|
  user.name = 'Asker'
end

@default_answerer = User.find_or_create_by(role: :answerer, default_record: true) do |user|
  user.name = 'Answerer'
end

[@default_event.users << @default_asker, @default_event.users << @default_answerer].each do |user|
  @default_event.users << user unless @default_event.users.include?(user)
end