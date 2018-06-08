class Event < ApplicationRecord
  def self.this_week_forward
    where('occurs_at >= ?', Time.current.beginning_of_week)
  end
end