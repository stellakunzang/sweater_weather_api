class LocationService

  def location(destination)
    response = conn.get("geocoding/v1/address") do |req|
      req.params[:key] = ENV["MAPQUEST_API_KEY"]
      req.params[:location] = destination
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("http://www.mapquestapi.com/")
  end
end
