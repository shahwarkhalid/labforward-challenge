module Respondable
  extend ActiveSupport::Concern

  def render_okay(json_content = {})
    render json: json_content, status: :ok
  end

  def render_error(status: :unprocessable_entity, errors: [])
    render json: { errors: errors }, status: status
  end

  def render_unauthorized(json_content = {})
    render json: json_content, status: :unauthorized
  end
end
