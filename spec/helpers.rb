# frozen_string_literal: true

module Helpers
  def json
    JSON.parse(response.body)
  end
end
