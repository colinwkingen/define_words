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
       Word.new("Potato").save()
       this_word = Word.all()[0]
      expect(this_word).to(eq(["Potato", 1, []]))
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
  describe("word#set_latest") do
    it("stores the id of the last word accessed") do
      word = Word.new("Potato")
      word.save()
      Word.set_latest(word.id)
      expect(Word.latest()).to(eq(0))
    end
  end
  describe("word#latest") do
    it("returns the INDEX of the last word accessed") do
      word1 = Word.new("Potato")
      word2 = Word.new("Yam")
      word1.save()
      word2.save()
      Word.set_latest(word1.id())
      expect(Word.latest()).to(eq(0))
    end
  end
end
