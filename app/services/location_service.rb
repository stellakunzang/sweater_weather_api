class LocationService

  def get_location(destination)
    response = conn.get("geocoding/v1/address") do |req|
      req.params[:key] = ENV["MAPQUEST_API_KEY"]
      req.params[:location] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def road_trip(origin, destination)
    response = conn.get("directions/v2/route") do |req|
      req.params[:key] = ENV["MAPQUEST_API_KEY"]
      req.params[:from] = origin
      req.params[:to] = destination
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("http://www.mapquestapi.com/")
  end
end
