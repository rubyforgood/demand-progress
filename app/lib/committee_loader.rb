# frozen_string_literal: true

# The CommmitteeLoader is used to load House/Senate committee/subcommittee
# relationships using data populated from the free ProPublica API.
#
# https://github.com/rails/rails/issues/13142#issuecomment-29969951
#
# Example usage:
#
#   CommitteeLoader.load(chamber: :house, parent: Committee.find_by(name: "House"))
class CommitteeLoader
  attr_reader :session, :chamber, :parent

  # Convenience, allowing CommitteeLoader.load(...) syntax
  class << self
    def load(session: 115, chamber:, parent:)
      new(session: session, chamber: chamber, parent: parent).load
    end
  end

  def initialize(session: 115, chamber:, parent:)
    @session = session
    @chamber = chamber
    @parent = parent
  end

  def load
    committee_response = HTTParty.get(url, headers).body

    committees = Oj.load(committee_response)["results"][0]["committees"]

    committees.each do |committee|
      new_committee = Committee.create!(name: committee["name"], code: committee["code"], website: committee["url"], parent: parent)

      committee["subcommittees"].each do |sub|

        sub_response = HTTParty.get(sub["api_uri"], headers).body

        sub_result = Oj.load(sub_response)["results"][0]

        # NOTE: I don't think the subcommittees actually have a website,
        # but should investigate these subcommittee results further
        subcommittee = Committee.create!(name: sub_result["name"], code: sub_result["id"], parent: new_committee)
      end
    end
  end

  private

    def url
      "https://api.propublica.org/congress/v1/#{session}/#{chamber}/committees.json"
    end

    # ProPublica API requires the API key in the headers
    def headers
      { headers: { "X-API-Key" => ENV.fetch("PROPUBLICA_API_KEY") } }
    end
end
