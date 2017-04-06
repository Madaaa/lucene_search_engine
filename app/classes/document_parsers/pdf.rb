module Pdf
  def reader
    PDF::Reader.new @file_path
  end

  def parse
    reader.pages.each { |page| @content += page.text }
  end
end
