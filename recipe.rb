class Recipe
  attr_reader :name, :description, :rating, :prep_time

  def initialize(name, description, prep_time = "", rating = 0)
    @name = name
    @description = description
    @rating = rating
    @prep_time = prep_time
  end
end


# blub = Recipe.new("asd", "asd", 123)
# test = Recipe.new("asd", "asdasd")

# p blub
# p test
