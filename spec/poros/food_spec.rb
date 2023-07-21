require 'rails_helper'

RSpec.describe Food do
  it 'creates food objects' do
    food_data = load_food_data
    food = Food.new(food_data)

    expect(food).to be_a(Food)
    expect(food.code).to eq(983525)
    expect(food.description).to eq('SWEET POTATOES')
    expect(food.ingredients).to eq('ORGANIC SWEET POTATOES.')
    expect(food.owner).to eq('NOT A BRANDED ITEM')
  end
end
