module Txt
  def reader
    File.open @file_path, 'r'
  end

  def parse
    reader.each_line { |line| @content += line }
  end
end
