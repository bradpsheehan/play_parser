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
      Parser.new(xml).personae.first.name.should == 'Ben'
      Parser.new(xml).personae[1].name.should == 'Brad'
    end

    it 'sets the number of lines spoken on all Persona objects' do
      Parser.new(xml).personae.first.number_of_lines_spoken.should == 2
      Parser.new(xml).personae[1].number_of_lines_spoken.should == 3
    end
  end

  def xml
    File.read('spec/fixtures/medium_length_play.xml')
  end
end
