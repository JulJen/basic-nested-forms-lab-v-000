class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    if @recipe.ingredients.last.try(:name)
      @recipe.ingredients.build
    end
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times { @recipe.ingredients.build }
    # @recipe.ingredients.build(name: 'sugar', quantity: '1 cup')
    # @recipe.ingredients.build(name: 'flour', quantity: '2 cups')
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
    :title, ingredient_attributes: [:id, :name, :quantity]
    )
  end
end
