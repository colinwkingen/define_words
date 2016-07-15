class Definition
  define_method(:initialize) do |new_definition|
    @definitions = new_definition
  end
  define_method(:definitions) do
    @definitions
  end
end
