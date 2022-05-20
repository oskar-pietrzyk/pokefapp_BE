# frozen_string_literal: true

module API
  module V1
    class Base < Core
      prefix :api

      version 'v1', using: :path, vendor: 'pokefapp'
      format :json
      formatter :json, Grape::Formatter::JSONAPIResources
      content_type :json, V1::Constants::CONTENT_TYPE

      mount API::V1::Welcome::Base
    end
  end
end
