require('rspec')
require './lib/definition'
require './lib/word'
describe('word') do
  before() do
    Word.clear()
  end
  describe("Word#name") do
    it("creates a simple word object") do
      word = Word.new("Potato")
      expect(word.name()).to(eq("Potato"))
    end
  end
  describe("Word#save") do
    it("looks takes a word object and saves it to an array of words") do
      enter_word = Word.new("Potato").save()
      expect(Word.all()).to(eq(enter_word))
    end
  end
  describe("Word#clear") do
    it("removes all stored words from the array") do
      word = Word.new("Potato").save()
      word = Word.new("Yam").save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end
  describe("word#add_definition") do
    it("stores the id of the last word accessed") do
      word = Word.new("Potato")
      word.save()
      word.add_definition("A starchy dirt fruit.")
      expect(word.definitions_local).to(eq(["A starchy dirt fruit."]))
    end
  end
  describe("word#find") do
    it("takes an index and compares it against that of another word") do
      word1 = Word.new("Potato")
      word2 = Word.new("Yam")
      word1.save()
      word2.save()

      expect(word1.id).to(eq(1))
    end
  end
end
