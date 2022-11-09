class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
  private

    def not_found_response(exception)
        render json: {error: "#{exception.model} not found"}, status: :not_found
    end

    def render_invalid(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end


end
