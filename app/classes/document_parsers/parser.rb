class Parser
  def initialize file_path
    @file_path = file_path
    @file_name =  File.basename(@file_path)
    @content = ''
  end

  def document
    @document = OpenStruct.new file_name: @file_name, content: @content
  end
end
