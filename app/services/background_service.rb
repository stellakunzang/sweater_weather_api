class BackgroundService

  def get_background(destination)
    response = conn.get("search/photos") do |req|
      req.headers['Accept-Version'] = 'v1'
      req.params[:query] = "#{destination} AND landscape"
      req.params[:orientation] = "landscape"
      req.params[:client_id] = ENV["UNSPLASH_CLIENT_ID"]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.unsplash.com/")
  end
end
