require_relative 'cookbook'
require_relative 'recipe'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'
set :bind, '0.0.0.0'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

cookbook = Cookbook.new('recipes.csv')

get '/' do
  @recipes = cookbook.all
  erb :index
end

get '/new' do
  erb :new
end

post '/recipes' do
  recipe = Recipe.new(params[:name], params[:description])
  cookbook.add_recipe(recipe)
  redirect to '/'
end

get '/recipes/:index' do

  cookbook.remove_recipe(params[:index].to_i)
  redirect to '/'
end

# get '/team/:username' do
#   # binding.pry
#   puts params[:username]
#   "The username is #{params[:username]}"
# end

# get '/' do
#   #@usernames = [ 'ssaunier', 'Papillard', 'asdacasd' ]
#   erb :index
# end
