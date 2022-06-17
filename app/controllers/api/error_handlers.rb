# frozen_string_literal: true

module API
  module ErrorHandlers
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordInvalid do |e|
        error!(e.record.errors.full_messages, 422)
      end

      rescue_from Grape::Exceptions::ValidationErrors do |e|
        error!(e.full_messages, 400)
      end
    end
  end
end
