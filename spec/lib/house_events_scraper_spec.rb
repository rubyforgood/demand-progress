require "rails_helper"

RSpec.describe HouseEventsScraper do
  # TODO: we should use VCR or mock the web requests somehow
  before(:all) do
    HouseEventsScraper.run
  end

  it "should add some events" do
    expect(Events.count).to be > 0
  end

  describe "an event" do
    it "should have a topic" do
      expect(Event.first.topic).to be_present
    end

    it "should have a date" do
      expect(Event.first.occurs_at).to be_present
    end

    it "should have location" do
      expect(Event.first.location).to be_present
    end
  end

  after(:all) do
    Event.destroy_all
  end
end
