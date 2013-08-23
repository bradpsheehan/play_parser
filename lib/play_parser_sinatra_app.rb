require 'sinatra'
require 'play_parser/play_parser'

class App < Sinatra::Base
  configure do
    set :raise_errors, true
    set :show_exceptions, false
  end

  get '/' do
    file = File.read('spec/fixtures/short_play.xml')
    parsed_play = Parser.new(file)

    @parsed_play = parsed_play
    erb :play
  end
end
