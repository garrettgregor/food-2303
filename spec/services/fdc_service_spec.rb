require 'rails_helper'

RSpec.describe FdcService do
  context 'instance methods' do
    describe '#search' do
      it 'returns 10 foods for a given search', :vcr do
        query = 'sweet potatoes'

        results = FdcService.new.search(query)
        expect(results).to be_a(Hash)

        foods = results[:foods]

        foods.each do |food|
          expect(food).to have_key(:fdcId)
          expect(food[:fdcId]).to be_an(Integer)

          expect(food).to have_key(:description)
          expect(food[:description]).to be_a(String)

          expect(food).to have_key(:ingredients)
          expect(food[:ingredients]).to be_a(String)

          expect(food).to have_key(:brandOwner)
          expect(food[:brandOwner]).to be_a(String)
        end
      end
    end

    describe '#food_count' do
      it 'returns the number of total number of foods for a search query', :vcr do
        query = 'sweet potatoes'

        result = FdcService.new.food_count(query)

        count = result[:totalHits]

        expect(count).to be_an(Integer)
        expect(count).to eq(55579)
      end
    end
  end
end