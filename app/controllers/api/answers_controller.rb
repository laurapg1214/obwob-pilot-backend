class Api::AnswersController < ApplicationController
  include QuestionLookup

  def index
    question = find_question
    return unless question

    answers = question.answers
    render json: answers, status: :ok 
  end

  def create
    question = find_question
    return unless question

    # validation: only emoji type questions can have numeric answer value
    if question.emoji? && !Answer::EMOJI_VALUES.keys.include?(answer_params[:answer_value].to_i)
      render json: { message: "Invalid emoji answer." }, status: unprocessable_entity
      return
    end

    answer = question.answers.new(answer_params)
    unless answer.save
      render json: { 
        message: "Failed to create answer.", 
        errors: answer.errors.full_messages 
      }, status: :unprocessable_entity
      return
    end

    render json: { 
      message: "Answer created successfully.", 
      answer: answer 
      }, status: :created 
  end

  private

  def answer_params
    params.require(:answer).permit(
      :participant_id, 
      :answer_text, 
      :answer_value
    )
  end

end
