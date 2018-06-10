# frozen_string_literal: true

class Organization < ApplicationRecord
  has_ancestry

  class << self
    # Create an Array of Hashes containing the Committees for House and
    # Senate. This is intended for conversion into JSON, and used by
    # the frontend for a list of committees (for checkboxes, for example)
    #
    # Example:
    #
    #   Organization.filter_list
    #
    #     [
    #       {:name=>"Caucus on International Narcotics Control", :code=>"SCNC", :count=>0},
    #        .....
    #       {:name=>"Committee on Agriculture, Nutrition, and Forestry", :code=>"SSAF", :count=>4},
    #     ]
    #
    # TODO: Using a random count for now. until we get actual events loaded
    # into the system
    def filter_list
      arrange_as_array.
      select { |c| c.depth == 2 }.
      reduce([]) { |m, i| m << { name: i.name, code: i.code, count: rand(10) } }
    end

    # https://github.com/stefankroes/ancestry/wiki/arrange_as_array
    def arrange_as_array(options={}, hash=nil)
      hash ||= arrange(options)

      arr = []

      hash.each do |node, children|
        arr << node
        arr += arrange_as_array(options, children) unless children.empty?
      end

      arr
    end
  end
end
