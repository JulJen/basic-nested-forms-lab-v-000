class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'sugar')
    @recipe.ingredients.build(name: 'flour')
    @recipe.ingredients.build(quantity: '1 cup')
    @recipe.ingredients.build(quantity: '2 cups')
  end

  def create
  end
end
