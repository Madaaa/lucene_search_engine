include Ferret

class Client
  attr_accessor :index

  def initialize path: 'app/data/lucene_results'
    delete_old_segments path

    @index = Index::Index.new(path: path, analyzer: RomanianAnalyzer.new)
  end

  def index_documents path: 'app/data/lucene_tests/*'
    Dir[path].each do |file_path|
      ext = File.extname(file_path).gsub('.', '').titleize.constantize
      parser = Parser.new(file_path).extend(ext)
      parser.parse
      @index << parser.document.to_h
    end
  end

  def search
    puts 'Enter word(s)'
    words = gets.chomp

    index.search_each("content: #{words}") do |id, score|
      highlighted_words = index.highlight("content: #{words}", id, highlight_options)
      puts "\nFound in #{index[id][:file_name]}"
      puts  highlighted_words
      puts "---------------------\n"
    end
  end

  private
  def highlight_options
    {
      excerpt_length: 30,
      num_excerpts: 3,
      field: :content,
      pre_tag: '<WORD>',
      post_tag: '</WORD>'
    }
  end

  def index_path
    index.options[:path]
  end

  def delete_old_segments path
    FileUtils.rm_rf Dir.glob(path)
  end
end
