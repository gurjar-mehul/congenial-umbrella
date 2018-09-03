class Api::V1::CarsController < ApplicationController
  before_action :find_car, :find_track

  # Car detail page
  # ====URL
  #   /api/v1/cars/:slug [GET]
  # ====Parameters
  #   track  nurburgring | sydney_motorsport_park | circuit_gilles_villenaeuve_montreal |
  #          guia_circut
  def show; end

  private

    def find_car
      @car = Car.friendly.find(params[:id]) || send_403!
    end

    def find_track
      @track = Track.find_by(name: params.dig(:track)&.downcase)
    end
end
