require 'nokogiri'

class Parser
  def initialize(play_xml_file)
    @document = Nokogiri::XML(play_xml_file)
  end

  def title
    @document.xpath('//TITLE').first.text
  end

  def personae
    @document.xpath('//PERSONA').map(&:text).map { |name| Persona.new(name) }
  end
end

class Persona
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

end
