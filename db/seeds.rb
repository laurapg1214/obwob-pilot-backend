# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# default records
event = Event.create!(name: 'Event', date: Date.today, time: Time.now, default_record: true)
question = Question.create!(content: 'Do you have any feedback?', default_record: true)
facilitator = User.create!(name: 'Facilitator', role: :facilitator, default_record: true)
participant = User.create!(name: 'Participant', role: :participant, default_record: true)
response = Response.create!(
  user: participant, 
  event: event, 
  question: question, 
  content: 'Thank you, obwob.', 
  default_record: true
)

event.questions << question
event.users << facilitator
event.users << participant

