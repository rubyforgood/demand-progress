# frozen_string_literal: true

json.extract! committee, :id, :name, :code, :website, :created_at, :updated_at
json.url committee_url(committee, format: :json)
