class EventsController < ApplicationController
  expose :events, -> { Event.this_week_forward.by_occurs_at }

  def index
  end
end
