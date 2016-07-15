class Word
  @@words = []
  @@latest = 0
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
    @@words.push([self.name, self.id, self.definitions_local])
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
    @@latest
  end
end
