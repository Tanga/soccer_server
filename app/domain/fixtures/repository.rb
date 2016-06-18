module Fixtures
  # In memory repository for fixtures
  class Repository
    @collection = {}

    def self.create attributes
      next_id = @collection.keys.length + 1
      @collection[next_id] =
        Fixtures::Fixture.new(attributes.merge(id: next_id))
    end

    def self.read id
      @collection[id]
    end

    def self.update id, attributes
      fixture = read(id)

      attributes.each do |field, value|
        fixture.send("#{field}=", value)
      end

      fixture
    end

    def self.delete id
      @collection.delete id
    end

    def self.__delete_all
      @collection = {}
    end
  end
end
