require 'json'
require 'unirest'
require 'rest-client'

class RecipesController < ApplicationController
  def index
    @user = current_user
    @fridge = @user.fridge
    @groceries = @fridge.groceries.where(grocerylist_id: nil)
    @string = ""
    @groceries.each do |g|
      unless params[g.name].nil?
        @string += "#{g.name}%20"
      end
    end
    @recipes = get_recipes(@string)
  end

  def get_recipes(groceries)
    # uri = URI("http://food2fork.com/api/search?key=#{ENV['F2F_API_KEY']}&q=#{groceries.to_s}&sort=r")
    # response = Net::HTTP.get_response(uri)
    # j = ActiveSupport::JSON
    # hash = j.decode(response.body)
    # @recipes = []
    # @recipes_hash = hash['recipes']
    # @recipes_hash.each do |hash|
    #   @recipes << Recipe.create(
    #     user_id: current_user.id,
    #     title: hash['title'],
    #     f2f_url: hash['f2f_url'],
    #     publisher: hash['publisher'],
    #     source_url: hash['source_url'],
    #     recipe_id: hash['recipe_id'],
    #     social_rank: hash['social_rank'],
    #     image_url: hash['image_url'],
    #   )
    # end
    # @recipes

    response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=false&ingredients=apples%2Cflour%2Csugar&limitLicense=false&number=5&ranking=1",
  headers:{
    "X-Mashape-Key" => ENV['SPOONACULAR_API_KEY'],
    "Accept" => "application/json"
  }
  binding.pry

  end
end
