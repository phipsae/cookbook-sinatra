require 'csv'
require_relative 'recipe'

class Cookbook
  # which loads existing Recipe from the CS all which returns all the recipes
  def initialize(csv_file_path)
    @filepath = csv_file_path
    @recipes = []
    cookbook_load
  end

  def all
    @recipes
  end

  # which adds a new recipe to the cookbook
  def add_recipe(recipe)
    @recipes << recipe
    cookbook_store
  end

  # which removes a recipe from the cookbook.
  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    cookbook_store
  end

  private

  def cookbook_load
    CSV.foreach(@filepath) { |row| @recipes << Recipe.new(row[0], row[1]) }
    @recipes
  end

  def cookbook_store
    CSV.open(@filepath, 'wb') do |csv|
      @recipes.each { |i| csv << [i.name, i.description] }
    end
  end
end
