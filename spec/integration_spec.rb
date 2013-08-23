require_relative '../lib/play_parser_sinatra_app'
require 'rspec'
require 'rack/test'

describe App, 'The parse_play application' do

  include Rack::Test::Methods

  it 'displays the title of the play' do
    get '/'
    last_response.body.should include 'The Tragedy of Julius Caesar'
  end

  it 'displays the persona name' do
    get '/'
    last_response.body.should include 'Ben'
  end

  def app
    App.new
  end
end
