require_relative '../lib/statistics_calculator'

describe StatisticsCalculator do
  describe '#number_of_lines_spoken_by' do
    it 'accepts a name and returns the number of lines spoken by that persona' do
      name = 'Ben'
      parsed_play = double(:parsed_play)
      parsed_play.stub(:lines_spoken_by).with(name).and_return(['Hi', 'How are you?'])

      StatisticsCalculator.new(parsed_play, name).number_of_lines_spoken.should == 2
    end
  end

  describe '#number_of_scene_appearances_by' do
    it 'accepts a name and returns the number of scence appearances by that persona' do
      name = 'Ben'
      parsed_play = double(:parsed_play)
      parsed_play.stub(:scene_appearances_by).with(name).and_return([{}, {}])

      StatisticsCalculator.new(parsed_play, name).number_of_scene_appearances.should == 2
    end
  end
end
