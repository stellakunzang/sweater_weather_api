class LocationService

  def get_location(destination)
    response = conn.get("geocoding/v1/address") do |req|
      req.params[:key] = ENV["MAPQUEST_API_KEY"]
      req.params[:location] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def distance_to_trail(origin_lat, origin_lon, dest_lat, dest_lon)
    response = conn.get("directions/v2/route") do |req|
      req.params[:key] = ENV["MAPQUEST_API_KEY"]
      req.params[:from] = "#{origin_lat},#{origin_lon}"
      req.params[:to] = "#{dest_lat},#{dest_lon}"
    end
    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

  def road_trip(origin, destination)
    response = conn.get("directions/v2/route") do |req|
      req.params[:key] = ENV["MAPQUEST_API_KEY"]
      req.params[:from] = origin
      req.params[:to] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("http://www.mapquestapi.com/")
  end
end
