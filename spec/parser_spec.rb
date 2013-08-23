require_relative '../lib/play_parser/play_parser'

describe Parser do
  describe '#title' do
    it 'parses the title' do
      Parser.new(xml).title.should == 'The Tragedy of Julius Caesar'
    end
  end

  describe '#personae' do
    it 'returns Persona objects for all personae' do
      Parser.new(xml).personae.all? { |persona| persona.is_a?(Persona) }.should be_true
    end

    it 'sets the name on all Persona objects' do
      Parser.new(xml).personae.first.name.should == 'JULIUS CAESAR'
      Parser.new(xml).personae[1].name.should == 'OCTAVIUS CAESAR'
    end
  end

  def xml
    File.read('spec/fixtures/play.xml')
  end
end
