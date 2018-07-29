# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :find_event, :only => %i[show]

  def index
    @events = Event.this_week_forward.by_occurs_at
  end

  def show
    @event
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end
end
