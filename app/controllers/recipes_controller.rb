class RecipesController < ApplicationController
  def index
    @search_term = params[:looking_for] || 'chicken'
    @courses = Recipe.for(@search_term)
  end
end
