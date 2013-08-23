require_relative '../lib/play_parser_sinatra_app'
require 'rspec'
require 'rack/test'

describe App, 'The parse_play application' do

  include Rack::Test::Methods

  it 'displays the title of the play' do
    get_root
    body_should_include 'The Tragedy of Julius Caesar'
  end

  it 'displays the persona name' do
    get_root
    body_should_include 'Ben'
  end

  it 'displays number of lines spoken for one persona' do
    get_root
    body_should_include 1.to_s
  end

  def body_should_include(text)
    last_response.body.should include text
  end

  def get_root
    get '/'
  end

  def app
    App.new
  end
end
