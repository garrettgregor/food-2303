class FdcService
  def search(query)
    term = query.sub(' ', '%20')
    get_url("fdc/v1/foods/search?query=#{term}&dataType=&pageSize=10")
  end

  def food_count(query)
    term = query.sub(' ', '%20')
    get_url("fdc/v1/foods/search?query=#{term}&dataType=&pageSize=10")
  end

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