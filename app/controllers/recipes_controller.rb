class RecipesController < ApplicationController
  def index
    @groceries = Grocery.where(grocerylist_id: nil)
  end

  def show
  end

  def get_recipes(groceries)
    uri = URI("http://food2fork.com/api/search?key=#{ENV['F2F_API_KEY']}&q=#{groceries}")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end
end
