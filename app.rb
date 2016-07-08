
require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/define'

get('/') do
  erb(:index)
end
