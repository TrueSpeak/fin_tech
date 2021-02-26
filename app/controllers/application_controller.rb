# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def authenticate!
    return if signed_in?

    redirect_to root_path, alert: 'Access denied. You need to authorize'
  end
end
