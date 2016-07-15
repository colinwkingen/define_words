require('rspec')
require './lib/definition'
require './lib/word'
describe('word') do
  before() do
    Word.clear()
  end
  describe("Word#save") do
    it("creates a simple word object") do
      word = Word.new("Potato")
      expect(word.name()).to(eq("Potato"))
    end
  end
  # describe("Word#definitions") do
  #   it("looks for a definition and returns empty if none") do
  #     word = Word.new("Potato")
  #     expect(word.definitions()).to(eq(""))
  #   end
  # end
  # describe("Word#definitions") do
  #   it("looks for a definition and returns one if it exists in an array of definitions") do
  #     word = Word.new("Potato")
  #     word.add_definition(["Lumpy carb laden fruit of the soil."])
  #     expect(word.definitions()).to(eq("[\"Lumpy carb laden fruit of the soil.\"]"))
  #   end
  # end
  describe("word#id") do
    it("returns the id of a particular word") do
      word = Word.new("Potato")
      expect(word.id()).to(eq(1))
    end
  end
end
