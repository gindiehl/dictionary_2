class Definition
  @@definitions = []

  define_method(:initialize) do |define_word|
    @define_word = define_word
    @id = @@definitions.length().+(1)
  end

  define_method(:define_word) do
    @define_word
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id().eql?(id.to_i)
        found_definition = definition
      end
    end
    found_definition
  end
end
