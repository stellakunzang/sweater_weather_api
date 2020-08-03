class TrailService

  def get_trails(lat, lon)
    response = conn.get("data/get-trails") do |req|
      req.params[:key] = ENV["HIKING_PROJ_API_KEY"]
      req.params[:lat] = lat
      req.params[:lon] = lon
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://www.hikingproject.com/")
  end
end
