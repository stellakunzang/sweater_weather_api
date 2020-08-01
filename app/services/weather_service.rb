class WeatherService

  def forecast(lat, lon)
  response = conn.get("data/2.5/onecall") do |req|
    req.params[:lat] = lat
    req.params[:lon] = lon
    req.params[:exclude] = "minutely"
    req.params[:appid] = ENV["OPEN_WEATHER_API_KEY"]
   end
   json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("http://api.openweathermap.org/")
  end
end
