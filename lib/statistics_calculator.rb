class StatisticsCalculator
  def initialize(parsed_play)
    @parsed_play = parsed_play
  end

  def personae
    attributes = {}
    [Persona.new(attributes)]
  end

  def number_of_lines_spoken_by(name)
    @parsed_play.lines_spoken_by(name).count
  end

  def number_of_scene_appearances_by(name)
    @parsed_play.scene_appearances_by(name).count
  end
end

class Persona
  def initialize(attributes)
    @attributes = attributes
  end

  def name
    @attributes[:name]
  end

  def lines_spoken
    @attributes[:lines_spoken]
  end

  def scene_appearances
    @attributes[:scene_appearances]
  end
end
