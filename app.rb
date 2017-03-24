require 'sinatra'

adjectives = File.readlines('txt/adjectives.txt')
nouns = File.readlines('txt/nouns.txt')

get '/' do
  erb :home
end

get '/version' do
  '0.1.0'
end

get '/api/v1' do
  adjective = adjectives.sample.strip
  noun = nouns.sample.strip
  "#{adjective}-#{noun}"
end

not_found do
  halt 404, "Going farther then I originally designed this to do eh?"
end
