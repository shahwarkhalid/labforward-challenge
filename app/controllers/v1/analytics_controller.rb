module V1
  class AnalyticsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_valid_data, only: :identify_peaks

    def identify_peaks
      render_okay(Analytics::IdentifyPeaksService.new(data: params[:data], threshold: params[:threshold]).call)
    end

    private

    def ensure_valid_data
      render_error(errors: ['Data array should be present.']) and return if params[:data].blank?
      render_error(errors: ['Threshold should be present.']) and return if params[:threshold].blank?
      render_error(errors: ['Data should be an array.']) and return unless params[:data].is_a? Array
    end
  end
end
