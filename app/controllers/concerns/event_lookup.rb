module EventLookup
  extend ActiveSupport::Concern

  def find_event
    event = Event.find_by(id: params[:event_id])
    unless event
      render json: { message: "Event does not exist." }, status: :not_found
      return nil
    end
    event
  end
end
