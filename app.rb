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
get('/local_definition') do
  @this_index = params.fetch('view_defs').to_i
  Word.set_latest(@this_index)
  @current_word = Word.all()[Word.latest()]
  erb(:word_addition)
end

post('/local_definition') do
  @this_index = params.fetch('view_defs').to_i
  Word.set_latest(@this_index)
  @current_word = Word.all()[Word.latest()]
  erb(:word_addition)
end

get('/defined_it') do
  @current_word = Word.all()[Word.latest().to_i]
  erb(:word_addition)
end
post('/defined_it') do
  @current_word = Word.all()[Word.latest().to_i]
  @current_word[2].push(Definition.new(params.fetch('new_definition')))
  erb(:word_addition)
end
