# frozen_string_literal: true

class Food
  attr_reader :code,
              :description,
              :ingredients,
              :owner

  def initialize(data)
    @code         = data[:fdcId]
    @description  = data[:description]
    @ingredients  = data[:ingredients]
    @owner        = data[:brandOwner]
  end
end
