require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/define'
get('/') do
  erb(:index)
end

post('/addition') do
  @new_word = params.fetch('new_word')
  @new_word_object = Word.new(@new_word).save()
  @word_list = Word.all()
  erb(:index)
end

post('/local_definition') do
  @this_index = params.fetch('view_defs')
  Word.set_latest(@this_index)
  @current_word = Word.all()[Word.latest()]
  erb(:word_addition)
end
get('/local_definition') do
  @current_word = Word.get_by_index(Word.latest().to_i)
end

post('/defined_it') do
  @current_word = Word.all()[Word.latest()]
  @new_definition = params.fetch('new_definition')
  @current_word[2] += @new_definition
  erb(:word_addition)
end
get('/defined_it') do
  @current_word = Word.get_by_index(Word.latest().to_i)
  erb(:word_addition)
end
