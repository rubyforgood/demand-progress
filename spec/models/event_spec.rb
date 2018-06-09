# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event, type: :model do
  describe ".this_week_forward" do
    it "should include events happening this week" do
      event = create :event, :this_week

      expect(Event.this_week_forward).to include event
    end

    it "should include events happening next week" do
      event = create :event, :next_week

      expect(Event.this_week_forward).to include event
    end

    it "should not include events that happened last week" do
      event = create :event, :last_week

      expect(Event.this_week_forward).to_not include event
    end
  end

  describe '.by_occurs_at' do
    it "should order the events by the `occurs_at` attribute (in asc order)" do
      newer_event = create :event, :next_week
      older_event = create :event, :this_week

      expect(Event.by_occurs_at).to eq [older_event, newer_event]
    end
  end
end
