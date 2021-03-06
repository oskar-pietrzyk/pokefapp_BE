# frozen_string_literal: true

module API
  module V1
    module Users
      class Base < API::V1::Base
        desc 'Users API endpoints'

        resource :users do
          mount Create
        end
      end
    end
  end
end
