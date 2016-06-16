module Fixtures
  # In memory repository for fixtures
  class Repository
    @collection = {}

    def self.create attributes
      next_id = @collection.keys.length + 1
      @collection[next_id] =
        Fixtures::Fixture.new(attributes.merge(id: next_id))
    end

    # def self.update fixture
    #   @collection[fixture.id] = fixture
    #   fixture
    # end

    # def self.read id
    #   @collection[id]
    # end

    # def self.delete(id)
    #   # NOT IMPLEMENTED
    # end

    # def self.list
    #   @collection.values
    # end

    # def self.reset
    #   @collection = {}
    # end
  end
end
