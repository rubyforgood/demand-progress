# frozen_string_literal: true

json.array! @committees, partial: "committees/committee", as: :committee
