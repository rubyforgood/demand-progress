# frozen_string_literal: true

class Event < ApplicationRecord
  def self.this_week_forward
    where("occurs_at >= ?", Time.current.beginning_of_week)
  end

  scope :by_occurs_at, -> { order(:occurs_at) }

  serialize :raw_location
  before_save :cache_formatted_location,
    if: Proc.new { changed.include? 'raw_location' }

  def self.agenda_by_date
    upcoming_agenda_dates.map { |date| { agenda_date: date, events: upcoming_events.select { |event| event.occurs_at.to_date == date }
      }}
  end

  private

    def upcoming_agenda_dates
      Event.this_week_forward.pluck(Arel.sql("distinct date(occurs_at)"))
    end

    def upcoming_events
      Event.this_week_forward.sort_by(&:occurs_at)
    end

    # TODO: Here is an example of a location that is not at the capitol complex:
    #   {:field=> {
    #     :"building-name"=>"Alpena Community College - Granum Theatre",
    #     :"street-address"=>"665 Johnson Street",
    #     :city=>"Alpena",
    #     :state=>[
    #       {:"postal-code"=>"MI"},
    #       {:"state-fullname"=>"Michigan"}
    #     ],
    #     :zip=>"49707"}}
    # For now, events that are not at the capitol complex are not formated and
    # cached, so their `location` will be empty.
    def cache_formatted_location
      building_name = raw_location[:'capitol-complex'][:building]
      room_name = raw_location[:'capitol-complex'][:room]
      self.location = "Building: #{building_name}, Room: #{room_name}"
    rescue NoMethodError
      logger.debug "Unknown location format found. Here is the structure:\n"
      logger.debug raw_location.inspect
    end
end
