class SearchFacade
  def all_merchants
    service = FdcService.new

    json = service.#method_name

    # @foods = json[:data].map { |details| Food.new(details) }
    # @food = Food.new(json[:data])
  end
end