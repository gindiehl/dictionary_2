require "definition"
require "rspec"
require "pry"

describe("Definition") do

  before() do
    Definition.clear()
  end

  describe("#define_word") do
    it("returns the definition of word") do
      new_definition = Definition.new("a curved symmetrical structure spanning an opening and typically supporting the weight of a bridge, roof, or wall above it.")
      expect(new_definition.define_word()).to(eq("a curved symmetrical structure spanning an opening and typically supporting the weight of a bridge, roof, or wall above it."))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a definition to the array of saved definitions") do
      new_definition = Definition.new("a curved symmetrical structure spanning an opening and typically supporting the weight of a bridge, roof, or wall above it.")
      new_definition.save()
      expect(Definition.all()).to(eq([new_definition]))
    end
  end

  describe(".clear") do
    it("clears the array of saved definitions") do
      Definition.new("a curved symmetrical structure spanning an opening and typically supporting the weight of a bridge, roof, or wall above it.").save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the definition") do
      new_definition = Definition.new("a curved symmetrical structure spanning an opening and typically supporting the weight of a bridge, roof, or wall above it.")
      expect(new_definition.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("returns definition by its id number") do
      new_definition = Definition.new("a curved symmetrical structure spanning an opening and typically supporting the weight of a bridge, roof, or wall above it.")
      new_definition.save()
      expect(Definition.find(new_definition.id())).to(eq(new_definition))
    end
  end
end
