# frozen_string_literal: true

# HouseEventsScraper is used to load House hearings from the house's website:
#   https://docs.house.gov/Committee/Calendar/ByWeek.aspx
# It currently just grabs this week and next week's hearings. We'll need to make
# this more sophisticated in the future.
#
# Example usage:
#   HouseEventsScraper.run

class HouseEventsScraper
  def run
    persist!(xml_events)
  end

  def self.run
    new.run
  end

  private

  # TODO: this needs to be more sophisticated - need to resolve updates, deletes
  def persist!(xml_events)
    xml_events.each do |xml_event|
      event_hash = Ox.load(xml_event, mode: :hash)
      Event.create(
        topic: event_hash[:'meeting-title'],
        location: event_hash[:'meeting-location'][:room]
      )
    end
  end

  def xml_events
    meeting_details_pages.map do |page|
      page.form_with(id: "Form1").submit
    end
  end

  def meeting_details_pages
    index_page.links_with(text: "Meeting Details").map(&:click)
  end

  def index_page
    Mechanize.new.get("https://docs.house.gov/Committee/Calendar/ByWeek.aspx")
  end
end
