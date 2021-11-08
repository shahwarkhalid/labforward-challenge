class ApplicationController < ActionController::API
  include Respondable

  def root
    redirect_to '/api-docs/'
  end
end
