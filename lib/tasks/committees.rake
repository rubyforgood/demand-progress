# frozen_string_literal: true

# These rake tasks populate the House/Senate relationships from the ProPublica
# free API (registration & API key required). By default, they point to the
# House/Senate children of the 115th Session. This should be refactored for
# extensiblity if needed later.

namespace "committees" do
  namespace "house" do
    desc "Load House Committees and Subcommittees"
    task :load do
      OrganizationLoader.load(chamber: :house, parent: Organization.find_by(name: "House"))
    end
  end

  namespace "senate" do
    desc "Load Senate Committees and Subcommittees"
    task :load do
      OrganizationLoader.load(chamber: :senate, parent: Organization.find_by(name: "Senate"))
    end
  end
end
