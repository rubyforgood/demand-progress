class EventsController < ApplicationController
  expose :events, -> { Event.this_week_forward }

  def index
  end
end
