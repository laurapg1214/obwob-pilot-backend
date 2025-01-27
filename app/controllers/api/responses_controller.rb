class Api::ResponsesController < ApplicationController
  def index
    question = Question.find_by(id: params[:question_id])
    unless question
      render json: { message: "Question does not exist." }, status: :not_found
      return
    end

    responses = question.responses
    render json: responses, status: :ok 
  end

  def create
    question = Question.find_by(id: params[:question_id])
    unless question
      render json: { message: "Question does not exist." }, status: :not_found
      return
    end

    # validation: only emoji type questions can have numeric response_value
    if question.emoji? && !Response::EMOJI_VALUES.keys.include?(response_params[:response_value].to_i)
      render json: { message: "Invalid emoji response." }, status: unprocessable_entity
      return
    end

    response = question.responses.new(response_params)
    unless response.save
      render json: { 
        message: "Failed to create response.", 
        errors: response.errors.full_messages 
      }, status: :unprocessable_entity
      return
    end

    render json: { 
      message: "Response created successfully.", 
      response: response 
      }, status: :created 
  end

  private

  def response_params
    params.require(:response).permit(
      :participant_id, 
      :response_text, 
      :response_value
    )
  end

end
