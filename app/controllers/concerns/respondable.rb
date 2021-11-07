module Respondable
  extend ActiveSupport::Concern

  def render_okay(json_content = {})
    render status: :ok, json: json_content
  end

  def render_error(status: :unprocessable_entity, errors: [])
    render status: status, json: { errors: errors }
  end
end
