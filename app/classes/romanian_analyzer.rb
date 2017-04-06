class RomanianAnalyzer < Ferret::Analysis::Analyzer
  include Ferret::Analysis

  def token_stream field, str
    MappingFilter.new(StemFilter.new(StopFilter.new(LowerCaseFilter.new(StandardTokenizer.new(str)), romanian_stop_words), 'ro'), romanian_letters_mapping)
  end

  private
  def romanian_stop_words
    IO.read('app/stopwords_ro.txt').split("\n")
  end

  def romanian_letters_mapping
    {
      ['ă', 'â'] => 'a',
      ['î'] => 'i',
      ['ț'] => 't',
      ['ș'] => 's'
    }
  end
end
