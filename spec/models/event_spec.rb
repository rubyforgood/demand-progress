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

  describe ".by_occurs_at" do
    it "should order the events by the `occurs_at` attribute (in asc order)" do
      newer_event = create :event, :next_week
      older_event = create :event, :this_week

      expect(Event.by_occurs_at).to eq [older_event, newer_event]
    end
  end

  describe "location" do
    it "is updated when a new raw location is saved" do
      raw_location = {"capitol-complex": {room: "H-313", building: "CAPITOL"}}
      event = create :event, raw_location: raw_location

      expect(event.location).to eq "Building: CAPITOL, Room: H-313"
    end

    it "doesn't mess up events that have a location saved directly" do
      event = create :event, location: "D.C. Zoo"

      expect(event.location).to eq "D.C. Zoo"
    end
  end
end
