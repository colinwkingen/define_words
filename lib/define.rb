class Word
  @@words = []
  define_method(:initialize) do |word|
    @word = word
    @id = @@words.length().to_i + 1
  end
  define_method(:single_word) do
    @word
  end
  define_method(:add_definition) do
    @word
  end
  define_method(:save) do
    @@words.push(word)
  end
end


class Definition
  @@definitions = []
  define_method(:initialize) do |definition, word|
    @definition = definition
    @word = word
  end
  define_method(:save) do |definition|
    @@definitions.push(definition)
  end

end
