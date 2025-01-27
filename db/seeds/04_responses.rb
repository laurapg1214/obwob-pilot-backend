# default record
Response.find_or_create_by(default_record: true) do |response|
  response.user = @default_participant 
  response.event = @default_event 
  response.question = @default_question 
  response_content = 'Thank you, obwob.'
end