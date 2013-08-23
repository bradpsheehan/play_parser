require_relative '../lib/statistics_calculator'

describe StatisticsCalculator do
  describe '#personae' do
    it 'returns a collection of persona objects' do
      parsed_play = 'ben'
      StatisticsCalculator.new(parsed_play).personae.all? { |persona| persona.is_a?(Persona) }.
        should be_true
    end
  end

  describe '#number_of_lines_spoken_by' do
    it 'accepts a name and returns the number of lines spoken by that persona' do
      parsed_play = double(:parsed_play)
      parsed_play.stub(:lines_spoken_by).with('Ben').and_return(['Hi', 'How are you?'])

      StatisticsCalculator.new(parsed_play).number_of_lines_spoken_by('Ben').should == 2
    end
  end

  describe '#number_of_scene_appearances_by' do
    it 'accepts a name and returns the number of scence appearances by that persona' do
      parsed_play = double(:parsed_play)
      parsed_play.stub(:scene_appearances_by).with('Brad').and_return([{}, {}])

      StatisticsCalculator.new(parsed_play).number_of_scene_appearances_by('Brad').should == 2
    end
  end
end

describe Persona do
  describe '#name' do
    it 'returns the name of persona' do
      Persona.new(name: 'Ben').name.should == 'Ben'
    end
  end

  describe '#lines_spoken' do
    it 'returns the number of lines spoken by the persona' do
      Persona.new(lines_spoken: 10).lines_spoken.should == 10
    end
  end

  describe '#scene_appearances' do
    it 'returns the number of scene appearances by the persona' do
      Persona.new(scene_appearances: 25).scene_appearances.should == 25
    end
  end
end

# @personae.each do |persona|
#   persona.name
#   persona.lines_spoken
#   persona.scene_appearances
# end
