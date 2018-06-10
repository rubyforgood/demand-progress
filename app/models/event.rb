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
end
