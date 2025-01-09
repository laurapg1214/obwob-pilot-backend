class Api::EventsController < ApplicationController
  ### v2 ###
  def index
    @events = Event.all
    render 'events/index'
  end
end