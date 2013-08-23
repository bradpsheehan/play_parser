require 'nokogiri'

class Parser
  def initialize(play_xml_file)
    @document = Nokogiri::XML(play_xml_file)
  end

  def title
    @document.xpath('//TITLE').first.text
  end
end
