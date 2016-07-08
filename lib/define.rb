class Word
  @@words = []
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
  define_singleton_method(:all) do
    @@words
  end
  define_singleton_method(:clear) do
    @@words = []
  end
end


class Definition
  define_method(:initialize) do
    @definitions = ""
  end
  define_method(:save_definition) do |definition|
    @definitions.push(definition)
  end
  define_method(:regurgitate_definitions) do
      @definitions
  end
end
