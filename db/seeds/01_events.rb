# default record
@default_event = Event.find_or_create_by(default_record: true) do |event|
  event.name = 'Event'
  event.date = Date.today
  event.time = Time.now
end