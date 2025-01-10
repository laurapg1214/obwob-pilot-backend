class EventChannel < ApplicationCable::Channel # participants only
  # method called when participant subscribes to the channel
  def subscribe_to_event(data)
    @event = Event.find_by(id: data['event_id'])

    unless @event
      reject 
      return
    end

    stream_for @event
  end

  # method called when message received from client
  def received(data)
    unless data['message'].present?
      # log error
      Rails.logger.error "Message not found in data: #{data.inspect}."

      # broadcast error to frontend for React to display to facilitator
      ActionCable.server.broadcast(
        "event_#{@event.id}_channel",
        error: "Sorry, there was a problem pushing the question. Please try again."
      )
      return
    end

    # broadcast message to participants
    broadcast_to(@event, data['message'])
  end

  def unsubscribed
    stop_all_streams
  end
end
