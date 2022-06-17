# frozen_string_literal: true

module API
  module V1
    module Welcome
      class Base < API::V1::Base
        desc 'Retrun hello message'

        get :hello do
          message = { message: 'hello' }
          render message
        end
      end
    end
  end
end
