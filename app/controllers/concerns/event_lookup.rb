module EventLookup
  extend ActiveSupport::Concern

  def find_event
    Rails.logger.debug "Received params: #{params.inspect}"
    event = Event.find_by(id: params[:event_id])
    unless event
      Rails.logger.debug "Event with ID #{params[:event_id]} not found"
      render json: { message: "Event does not exist." }, status: :not_found
      return nil
    end
    Rails.logger.debug "Found event: #{event.inspect}"
    event
  end
end
