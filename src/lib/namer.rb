require "namer/version"
require 'sinatra'

module Namer
  class Server < Sinatra::Base
    adjectives = File.readlines(File.join(File.dirname(__FILE__), '../data/adjectives.txt'))
    nouns = File.readlines(File.join(File.dirname(__FILE__), '../data/nouns.txt'))

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
  end
end
