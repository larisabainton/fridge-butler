require 'json'

class RecipesController < ApplicationController
  def index
    @groceries = Grocery.where(grocerylist_id: nil)
    @recipes = get_recipes('chicken')
  end

  def get_recipes(groceries)
    uri = URI("http://food2fork.com/api/search?key=#{ENV['F2F_API_KEY']}&q=#{groceries.to_s}")
    response = Net::HTTP.get_response(uri)
    binding.pry
    JSON.parse(response.body)
  end
end
