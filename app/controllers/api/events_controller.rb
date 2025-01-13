class Api::EventsController < ApplicationController
  ### v2 ###
  ### AT v3, REPLACE THIS WITH v3 VERSION BELOW ###
  # def index
  # end

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
