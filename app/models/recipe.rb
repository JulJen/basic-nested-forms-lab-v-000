class Recipe < ActiveRecord::Base
  has_many :ingredients
   accepts_nested_attributes_for :ingredients
   before_save :erase_empty_ingredients

  def erase_empty_ingredients
    self.ingredients = self.ingredients.select {|i| i.name && i.name != '' || i.quantity && i.quantity != ''}
  end

  def ingredient_attributes=(ingredient)
    self.ingredient = Ingredient.find_or_create_by(name: ingredient.name)
    self.ingredient.update(ingredient)
  end
end
