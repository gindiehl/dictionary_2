require "word"
require "rspec"
require "pry"


describe("Word") do

  before() do
    Word.clear()
  end

  describe("#new_word") do
    it("returns new word") do
      new_entry = Word.new("arch")
      expect(new_entry.new_word()).to(eq("arch"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a new word to the array of saved words") do
      new_term = Word.new("arch")
      new_term.save()
      expect(Word.all()).to(eq([new_term]))
    end
  end

  describe(".clear") do
    it("clears the word array") do
      Word.new("arch").save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the word") do
      new_term = Word.new("arch")
      expect(new_term.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("returns new word by its id number") do
      new_term = Word.new("arch")
      new_term.save()
      expect(Word.find(new_term.id())).to(eq(new_term))
    end
  end

  describe("#add_definition") do
    it("adds a new definition to a word") do
      new_term = Word.new("arch")
      new_definition = Definition.new("a curved symmetrical structure spanning an opening and typically supporting the weight of a bridge, roof, or wall above it.")
      new_term.add_definition(new_definition)
      expect(new_term.term()).to(eq([new_definition]))
    end
  end
end
