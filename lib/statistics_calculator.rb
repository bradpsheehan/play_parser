class StatisticsCalculator
  def initialize(parsed_play, name)
    @parsed_play = parsed_play
    @name = name
  end

  def number_of_lines_spoken
    @parsed_play.lines_spoken_by(@name).count
  end

  def number_of_scene_appearances
    @parsed_play.scene_appearances_by(@name).count
  end
end
