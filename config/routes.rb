# frozen_string_literal: true

Rails.application.routes.draw do
  mount API::Core, at: '/'
  mount GrapeSwaggerRails::Engine => '/api/v1/docs'
end
