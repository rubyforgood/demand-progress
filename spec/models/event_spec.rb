require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '.this_week_forward' do
    it "should include events happening this week" do
      event = create :event, occurs_at: Time.current
      expect(Event.this_week_forward).to include event
    end

    it "should include events happening next week" do
      event = create :event, occurs_at: Time.current.next_week
      expect(Event.this_week_forward).to include event
    end

    it "should not include events that happened last week" do
      event = create :event, occurs_at: Time.current.last_week
      expect(Event.this_week_forward).to_not include event
    end
  end
end
