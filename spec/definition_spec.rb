require('rspec')
require './lib/definition'
require './lib/word'
describe('word') do
  before() do
    Word.clear()
  end
  describe("Definition#definitions") do
    it("creates a simple definition object and returns its contained value") do
      definition = Definition.new("Potato")
      expect(definition.definitions()).to(eq("Potato"))
    end
  end
end
