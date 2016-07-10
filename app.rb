require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/define'
@@current_word = []
@@word_index = []
get('/') do
  erb(:index)
end
get('/') do
  @words = Word.all()
  @word = @@current_word.each()[0]
  @index = @@current_word.each()[1]
  erb(:index)
end
post('/addition') do
  @new_entry = params.fetch('new_word')
  @@current_word = Word.new(params.fetch('new_word')).save()
  @words = Word.all().join(" ")
  Word.set_latest(@@current_word[-1][2])
  erb(:word_addition)
end
get('/') do
  @words = Word.all().split(", ")
  erb(:word_addition)
end
get('/addition') do
  @words = Word.all()
  erb(:word_addition)
end
post('/defined_it') do
  definition = params.fetch('new_definition')
  @@current_word[Word.latest().to_i][2] += definition
  erb(:word_addition)
end
post('/local_definition') do
  @@word_index.push(params.fetch('view_defs').to_i)
  Word.set_latest(params.fetch('view_defs').to_i)
  erb(:word_addition)
end
get('/local_definition') do
  Word.set_latest(params.fetch('view_defs').to_i)
  @@word_index.push(params.fetch('view_defs').to_i)
  # @@current_word[Word.latest()][2] += @definition
  erb(:word_addition)
end
