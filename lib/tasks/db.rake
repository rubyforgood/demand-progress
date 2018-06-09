# frozen_string_literal: true

namespace :db do
  desc "Populates the database with sample data (defined in db/sample)"
  task populate: :environment do
    sample_data_files = Rails.root.join("db", "sample", "**", "*.rb")
    Dir[sample_data_files].each { |f| require f }
  end

  desc "Resets the database and then populates it with the sample data"
  task repopulate: %i[reset populate]
end
