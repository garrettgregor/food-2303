# frozen_string_literal: true

class FoodsController < ApplicationController
  def index
    @foods = SearchFacade.new.search(params[:q])
    @food_count = SearchFacade.new.food_count(params[:q])
  end
end
