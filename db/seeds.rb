require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients_list = JSON.parse(ingredients_serialized)

ingredients_array = ingredients_list["drinks"].map do | element |
  { :name => element["strIngredient1"] }
end

ingredients = Ingredient.create(ingredients_array)

Cocktail.create([{ name: 'Mojito' }, { name: 'Lord of the Rings' }])

Dose.create([{ description: '20cl', cocktail_id: 1, ingredient_id: 1}, { description: '30cl', cocktail_id: 1, ingredient_id: 10}, { description: '50cl', cocktail_id: 2, ingredient_id: 11}])
