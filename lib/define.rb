class Word
  @@words = []
  define_method(:initialize) do |word|
    @word = word
    @definitions = []
    @id = @@words.length().to_i + 1
  end
  define_method(:single_word) do
    @word
  end
  define_method(:definitions) do
    @definitions
  end
  define_method(:definitions) do
    @id
  end
  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end
  define_method(:save) do
    @@words.push(self)
  end
  define_method(:all) do
    @@words
  end
end


class Definition
  @@definitions = []
  define_method(:initialize) do |definition, word|
    @definition = definition
    @word = word    
  end
  define_method(:save) do |definition|
    @@definitions.push(self)
  end
end
