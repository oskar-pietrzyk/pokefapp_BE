# frozen_string_literal: true

module API
  class Core < Grape::API
    mount API::V1::Base

    add_swagger_documentation \
      mount_path: '/v1/docs',
      produces: 'application/vnd.api+json',
      info: {
        title: 'pokefapp API',
        description: 'Pokefapp API prepared for battle',
        contact_name: 'oskpie',
        contact_email: 'random@email.com'
      }
  end
end
