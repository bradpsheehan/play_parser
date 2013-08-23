require 'nokogiri'

class Parser
  def initialize(play_xml_file)
    @document = Nokogiri::XML(play_xml_file)
  end

  def title
    @document.xpath('//TITLE').first.text
  end

  def personae
    @document.xpath('//PERSONA').map(&:text).
      map { |name| Persona.new(name, number_of_lines_spoken_by(name)) }
  end

  def number_of_lines_spoken_by(name)
    puts @document.xpath('//SPEECH').select { |speech| speech.children.first.text == name }


  end
end

class Persona
  def initialize(name, number_of_lines_spoken)
    @name = name
    @number_of_lines_spoken = number_of_lines_spoken
  end

  def name
    @name
  end

  def number_of_lines_spoken
    @number_of_lines_spoken
  end

end
