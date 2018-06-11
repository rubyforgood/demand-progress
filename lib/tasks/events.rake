# frozen_string_literal: true

namespace "events" do
  namespace "house" do
    desc "Load upcoming house hearings"
    task scrape: :environment do
      HouseEventsScraper.run
    end
  end
end
