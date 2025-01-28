# default record
@default_question = Question.find_or_create_by(default_record: true) do |question| 
  question.text = 'Do you have any feedback?'
end
@default_event.questions << @default_question unless @default_event.questions.include?(@default_question)