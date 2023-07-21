# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchFacade do
  context 'class methods' do
    describe '.search' do
      it 'returns 10 foods for a given search', :vcr do
        query = 'sweet potatoes'

        results = SearchFacade.new.search(query)

        expect(results).to be_an(Array)

        results.each do |result|
          expect(result).to be_a(Food)
          expect(result.code).to be_an(Integer)
          expect(result.description).to be_a(String)
          expect(result.ingredients).to be_a(String)
          expect(result.owner).to be_a(String)
        end
      end
    end

    describe '.food_count' do
      it 'returns the number of total number of foods for a search query', :vcr do
        query = 'sweet potatoes'

        result = SearchFacade.new.food_count(query)

        expect(result).to be_an(Integer)
      end
    end
  end
end
