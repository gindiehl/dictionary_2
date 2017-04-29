require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require './lib/definition'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/words/new') do
  erb(:word_form)
end

get('/words') do
    @words = Word.all()
  erb(:words)
end
#  push word form "form action" to words array
post('/words') do
  new_word = params.fetch('new_word')
  Word.new(new_word).save()
  @words = Word.all()
  erb(:words)
end
#click on word to route to page of definitions for that word
get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/definition_form') do
  erb(:definition_form)
end

get('/definition_form') do
  @definition = Definition.all()
  erb(:word)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  erb(:definition)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word_definitions_form)
end

post('/definitions') do
  define_word = params.fetch('define_word')
  @definition = Definition.new(define_word)
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  @words = Word.all()
  erb(:words)
end
