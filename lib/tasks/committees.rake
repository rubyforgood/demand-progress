# frozen_string_literal: true

# These rake tasks populate the House/Senate relationships from the ProPublica
# free API (registration & API key required). By default, they point to the
# House/Senate children of the 115th Session. This should be refactored for
# extensiblity if needed later.

namespace "committees" do
  namespace "house" do
    desc "Load House Committees and Subcommittees"
    task :load do
      CommitteeLoader.load(chamber: :house, parent: Committee.find_by(name: "House"))
    end
  end

  namespace "senate" do
    desc "Load Senate Committees and Subcommittees"
    task :load do
      CommitteeLoader.load(chamber: :senate, parent: Committee.find_by(name: "Senate"))
    end
  end
end
