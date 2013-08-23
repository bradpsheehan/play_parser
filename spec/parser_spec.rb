require_relative '../lib/play_parser/play_parser'

describe Parser do
  it 'parses the title' do
    xml = File.read('spec/fixtures/play.xml')
    Parser.new(xml).title.should == 'The Tragedy of Julius Caesar'
  end
end
