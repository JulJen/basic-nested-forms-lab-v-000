class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredient_attributes=(ingredient)
    # self.ingredient = Ingredient.find_or_create_by(name: ingredient.name)
    # self.ingredient.update(ingredient)
    ingredient_attributes.each do |i, ingredient_attributes|
      if ingredient.strip != nil
      self.ingredients.build(ingredient_attributes)
    end
  end
end
