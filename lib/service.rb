require 'net/http'
require 'json'

class Service
  attr_accessor :units, :key
  attr_reader :url

  def initialize
    @units = 'metric'
    @key = 'c8367896c029db37f610ee38746ee03e'
    @url = 'http://api.openweathermap.org/data/2.5'
  end

  # GET /weather
  def weather(city)
    uri = URI("#{@url}/weather")
    params = {
      :q => city,
      :units => @units,
      :APPID => @key
    }
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      data = JSON.parse(response.body)
      # puts JSON.pretty_generate(data)
      return data
    end
    return {}
  end

end
