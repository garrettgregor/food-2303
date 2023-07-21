# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/foods', type: :feature do
  describe 'as a visitor' do
    it 'has information about the food that was searched for', :vcr do
      visit root_path

      fill_in(:q, with: 'sweet potatoes')
      click_on('Search')

      expect(current_path).to eq(foods_path)
      expect(page).to have_content('Total # of SWEET POTATOES: 55579')
      expect(page).to have_content('GTIN/UPC Code: 983525')
      expect(page).to have_content('Description: SWEET POTATOES')
      expect(page).to have_content('Ingredients: ORGANIC SWEET POTATOES.')
      expect(page).to have_content('Brand Owner: NOT A BRANDED ITEM')
    end
  end
end
