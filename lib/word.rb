class Word
  @@words = []

  define_method(:initialize) do |new_word|
    @new_word = new_word
    @id = @@words.length().+(1)
    @term = []
  end

  define_method(:new_word) do
    @new_word
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words.each() do |word|
      if word.id().eql?(id.to_i)
        found_word = word
      end
    end
    found_word
  end

  define_method(:term) do
    @term
  end

  define_method(:add_definition) do |definition|
    @term.push(definition)
  end
end
