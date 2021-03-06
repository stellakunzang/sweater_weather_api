class WeatherService

  def get_forecast(lat, lon)
  response = conn.get("data/2.5/onecall") do |req|
    req.params[:lat] = lat
    req.params[:lon] = lon
    req.params[:exclude] = "minutely"
    req.params[:units] = "imperial"
    req.params[:appid] = ENV["OPEN_WEATHER_API_KEY"]
   end
   JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("http://api.openweathermap.org/")
  end
end
