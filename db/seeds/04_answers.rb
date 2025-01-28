# default record
Answer.find_or_create_by(default_record: true) do |answer|
  answer.user = @default_answerer 
  answer.event = @default_event 
  answer.question = @default_question 
  answer = 'Thank you, obwob.'
end