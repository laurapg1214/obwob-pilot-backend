module QuestionLookup
  extend ActiveSupport::Concern

  def find_question
    question = Question.find_by(id: params[:question_id])
    unless question
      render json: { message: "Question does not exist." }, status: :not_found
      return nil
    end
    question
  end
end