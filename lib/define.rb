class Word
  @@words = []
  @@latest = 0
  define_method(:initialize) do |word|
    @name = word
    @definitions_local = Definition.new()
    @id = @@words.length().to_i.+(1)
  end
  define_method(:name) do
     @name
  end
  define_method(:definitions) do
    @definitions_local.regurgitate_definitions()
  end
  define_method(:id) do
    @id
  end
  define_method(:add_definition) do |definition|
    @definitions_local.save_definition(definition)
  end
  define_method(:save) do
    @@words.push([self.name, self.id, self.definitions])
  end
  define_singleton_method(:get_by_index) do |index|
    current_word = []
    @@words.each() do |word|
      if word[1] == index
        current_word = word
      end
    end
    current_word
  end
  define_singleton_method(:all) do
    @@words
  end
  define_singleton_method(:clear) do
    @@words = []
  end
  define_singleton_method(:set_latest) do |this_index|
    @@latest = this_index.to_i - 1
  end
  define_singleton_method(:latest) do
    @@latest.to_i
  end
end


class Definition
  define_method(:initialize) do
    @definitions = ""
  end
  define_method(:save_definition) do |definition|
    @definitions += definition.to_s
  end
  define_method(:regurgitate_definitions) do
    @definitions
  end
end
