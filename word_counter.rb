class WordCounter

  def initialize(name)
    raise 'File Not Found' unless File.exist?(name)
    @words = {}
    all_words = get_words(name)
    all_words.each do |word|
      add_word(word)
    end
  end

  def output
    @words.sort_by{ |_k, v| v }.reverse.take(5).each do |word|
      puts "#{word[1]} - #{word[0]}"
    end
  end

  private

  def get_words(name)
    File.readlines(name).map { |p| strip(p) }.reject(&:empty?).flatten
  end

  def strip(input)
    input.scan(/[\w']+/)
  end

  def add_word(word)
    if @words.key?(word.to_sym)
      @words[word.to_sym] += 1
    else
      @words[word.to_sym] = 1
    end
  end
end
