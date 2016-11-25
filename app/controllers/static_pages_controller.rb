class StaticPagesController < ApplicationController
  require 'forecast_io'
  before_action :initialize_forcast
  def home
  	@summary = @forecast.currently.summary.to_s
    @icon = @forecast.currently.icon
    @windSpeed = @forecast.currently.windSpeed
    @temperature = @forecast.currently.temperature
    @timezone = @forecast.timezone
    @latitude = params[:latitude]
    @longitude = params[:longitude]
  end

  def show
  end

  def play
  end
  private
  def initialize_forcast
	  ForecastIO.configure do |configuration|
	  	configuration.api_key = '0bef2f919bb436509ad32f8ad17ecc21'
	  end
	  lat = 37.8267
  	  long = -122.4233
  	  @forecast = ForecastIO.forecast(lat, long, params:{units:'si'})
  end
end
