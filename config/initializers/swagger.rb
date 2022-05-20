# frozen_string_literal: true

GrapeSwaggerRails.options.app_name = 'POKEFAPP API documentation'
GrapeSwaggerRails.options.url = '/v1/docs'

GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end
