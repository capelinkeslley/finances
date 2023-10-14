# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    rescue_from ActionController::UnknownFormat, with: :handle_unknown_format

    private

    def handle_unknown_format
      respond_to do |format|
        format.any { head :not_acceptable }
      end
    end
  end
end
