# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    render json: { message: 'Hello on the POKEFAPP' }
  end
end
