class Api::QuestionsController < ApplicationController
  ### AT v3, REPLACE THIS WITH v3 VERSION BELOW ###
  def index
    event = Event.find_by(id: params[:event_id])
    if event.nil?
      return render json: { message: "Event does not exist." }, status: :not_found
    end

    questions = event.questions
    if questions.empty?
      render json: { message: "No questions available for this event." }, status: :ok
    else
      render json: questions, status: :ok
    end
  end

  def push
    question = Question.find_by(id: params[:question_id])
    if question.nil?
      return render json: { message: "Question does not exist." }, status: :not_found
    else
      # use ActionCable to broadcast to Websocket channel
      ActionCable.server.broadcast(
        "event_#{question.event.id}_channel",
        { message: question.content, question_id: question.id }
      )
      render json: { message: "Question pushed successfully!" }, status: :ok
    end
  end

  ### v3 ###
  ### TODO: Replace above with this; add event check ###
  # def index
  #   questions = 
  #     ### if statement for v3 functionality ###
  #     if params[:event_id]
  #       # fetch questions assigned to specific event
  #       event = Event.find_by(params[:event_id]) # find_by returns nil if no event
  #       # if event = nil, return empty array for questions
  #       event ? event.questions : []
  #     else
  #       # fetch all questions
  #       Question.all
  #     end

  #   if questions.any?
  #     render json: questions
  #   else
  #     render json: { message: "No questions available." }
  #   end
  # end

  # def create
  # end
  
  # def update
  #   question = Question.find(params[:id])
  #   if question.update(status: params[:status])
  #     render json: { message: "Question updated successfully" }, status: :ok
  #   else
  #     render json: { errors: question.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  # def assign
  # end
end
