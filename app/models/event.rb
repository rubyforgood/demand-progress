# frozen_string_literal: true

class Event < ApplicationRecord
  def self.this_week_forward
    where("occurs_at >= ?", Time.current.beginning_of_week)
  end

  scope :by_occurs_at, -> { order(:occurs_at) }

  # TODO: on save, if raw_location is changed, format it and cache it `location`
  # example `raw_location`:
  #   <capitol-complex>
  #     <room>H-313</room>
  #     <building>CAPITOL</building>
  #   </capitol-complex>
  # another example:
  #   <capitol-complex>
  #     <room>2175</room>
  #     <building>RHOB</building>
  #   </capitol-complex>
  # The stakeholder said *most* will be at the capitol complex, so for now I
  # think it is safe to just write the formatting for that case.
  serialize :raw_location

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
end
