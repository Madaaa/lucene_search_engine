module Xml
  def reader
    Nokogiri::XML(File.read @file_path) do |config|
      config.noblanks
    end.remove_namespaces!
  end

  def parse
    reader.search(flag).each { |sentence| @content += sentence }
  end

  private
  def flag
    'sentence'
  end
end
