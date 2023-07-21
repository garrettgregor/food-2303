# frozen_string_literal: true

class SearchFacade
  def search(query)
    service = FdcService.new

    json = service.search(query)

    @foods = json[:foods].map { |details| Food.new(details) }
  end

  def food_count(query)
    service = FdcService.new

    json = service.food_count(query)

    @foods = json[:totalHits]
  end
end
