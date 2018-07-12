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
      attributes = EventParser.parse(xml_event)
      Event.create(attributes)
    end
  end

  def xml_events
    meeting_details_pages.map do |page|
      form = page.form_with(id: "Form1")
      form.add_field!("__EVENTTARGET", "ctl00$MainContent$LinkButtonDownloadMtgXML")
      file = form.submit
      file.body
    end
  end

  def meeting_details_pages
    index_page.links_with(text: "Meeting Details").map(&:click)
  end

  def index_page
    Mechanize.new.get("https://docs.house.gov/Committee/Calendar/ByWeek.aspx")
  end

  class EventParser
    def initialize(event_xml)
      @event_xml = Ox.load(event_xml, mode: :hash)
    end

    def parse
      {
        topic: topic,
        raw_location: raw_location,
        occurs_at: occurs_at
      }
    end

    def self.parse(event_xml)
      new(event_xml).parse
    end

    private

    def topic
      meeting_details[:'meeting-title']
    end

    def raw_location
      meeting_details[:'meeting-location']
    end

    def meeting_details
      meeting_details ||=
        @event_xml[:"committee-meeting"][5][:'meeting-details']
    end

    def occurs_at
      DateTime.parse(occurs_at_string)
    end

    def occurs_at_string
      [
        date_details[:'calendar-date'],
        date_details[:'start-time'],
        '-05:00'
      ].join(' ')
    end

    def date_details
      @date_details ||= meeting_details[:'meeting-date']
    end
  end
end
