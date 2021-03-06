# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  mount API::Core, at: '/'
  mount GrapeSwaggerRails::Engine => '/api/v1/docs'
end
