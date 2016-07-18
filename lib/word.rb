class Word
  @@words = []
  define_method(:initialize) do |word|
    @name = word
    @definitions_local = []
    @id = @@words.length().to_i.+(1)
  end
  define_method(:name) do
     @name
  end
  define_method(:definitions_local) do
    @definitions_local
  end
  define_method(:id) do
    @id
  end
  define_method(:save) do
    @@words.push(self)
  end
  define_method(:add_definition) do |new_definition|
    self.definitions_local().push(new_definition)
  end
  define_singleton_method(:all) do
    @@words
  end
  define_singleton_method(:clear) do
    @@words = []
  end
  define_singleton_method(:find) do |this_id|
    this_word = nil
    @@words.each() do |word|
      if word.id().eql?(this_id.to_i())
        this_word = word
      end
    end
    this_word
  end
end
