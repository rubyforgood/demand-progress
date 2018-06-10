require 'rails_helper'

RSpec.describe HouseEventsScraper::EventParser do
  let(:event_xml) { file_fixture("HHRG-115-RU00-20180605.xml").read }

  describe 'parsed attributes' do
    subject(:parsed_attributes) do
      HouseEventsScraper::EventParser.parse(event_xml)
    end

    it 'should have the correct topic' do
      expect(parsed_attributes[:topic]).to eq <<~TEXT.chomp
        H.R. 5895—Energy and Water Development and Related Agencies Appropriations Act, 2019 [Energy and Water, Legislative Branch, and Military Construction and Veterans Affairs Appropriations Act, 2019] (Showing the text of H.R. 5895, H.R. 5894, and H.R. 5786 as reported by the Committee on Appropriations, as modified.) [General Debate]; H.R. 8—Water Resources Development Act of 2018 (Rules Committee Print 115-72—Showing the text of H.R. 8 as ordered reported by the Committee on Transportation and Infrastructure, with modifications.); Senate Amendment to H.R. 3294—Project Safe Neighborhoods Grant Program Authorization Act of 2018
      TEXT
    end

    it 'should have the correct date and time' do
      expect(parsed_attributes[:occurs_at].year).to eq 2018
      expect(parsed_attributes[:occurs_at].month).to eq 6
      expect(parsed_attributes[:occurs_at].day).to eq 5
      expect(parsed_attributes[:occurs_at].hour).to eq 17
      expect(parsed_attributes[:occurs_at].minute).to eq 0
    end

    it 'should have the correct raw location' do
      expect(parsed_attributes[:raw_location]).to eq(
        {"capitol-complex": {room: "H-313", building: "CAPITOL"}}
      )
    end
  end
end
