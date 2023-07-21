class FdcService
  # def merchants_index
  #   get_url("/api/v1/merchants")
  # end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.nal.usda.gov/") do |faraday|
      faraday.headers["X-API-Key"] = ENV["FDC_API_KEY"]
    end
  end
end