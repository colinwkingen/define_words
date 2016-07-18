require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/definition'
require './lib/word'

get('/') do
  @word_list = Word.all()
  erb(:index)
end

post('/addition') do
  @new_word = params.fetch('new_word')
  Word.new(@new_word).save()
  @word_list = Word.all()
  erb(:index)
end
get('/local_definition/:id') do
  @current_word = Word.find(params.fetch('id'))
  erb(:word_addition)
end

post('/local_definition/:id') do
  @this_word = Word.find(params.fetch('id'))
  erb(:word_addition)
end

get('/defined_it') do
  @this_word = Word.find(params.fetch('id'))
  erb(:word_addition)
end

post('/defined_it') do
  @this_word = Word.find(params.fetch('id'))
  @this_word.add_definition(Definition.new(params.fetch('new_definition')))
  erb(:word_addition)
end
