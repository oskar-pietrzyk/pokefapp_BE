# frozen_string_literal: true

module API
  module ErrorHandlers
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordInvalid do |e|
        error_messages = {}
        e.record.errors.each do |error|
          error_messages.merge!(error.attribute.to_s => error.message)
        end

        error!(error_messages, 422)
      end

      rescue_from Grape::Exceptions::ValidationErrors do |e|
        error!(e.full_messages, 400)
      end
    end
  end
end
