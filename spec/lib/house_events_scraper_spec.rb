require "rails_helper"

RSpec.describe HouseEventsScraper do
  # TODO: we should use VCR or mock the web requests somehow
  before(:all) do
    HouseEventsScraper.run
  end

  it "should add some events" do
    skip "This actually makes web requests so let's turn it off by until we "\
         "fix that. If you're working on this class, just turn it on locally."
    expect(Event.count).to be > 0
  end

  after(:all) do
    Event.destroy_all
  end
end
