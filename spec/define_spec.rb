require('rspec')
require('define')
describe('define') do
  before() do
    Word.clear()
  end

  describe("Word#add_word") do
    it("adds a word to the list of defineable words") do
      word = Word.new("Potato")
      expect(word).to(eq("Potato"))
    end
  end
  describe("Word#add_definition") do
    it("adds a definition to a single word") do
      word = Word.new("Potato")
      word.add_definition("Lumpy carb laden fruit of the soil.")
      expect(word.definition()).to(eq("Potato"))
    end
  end
end
