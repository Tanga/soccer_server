module Matches
  # In memory Repository for matches
  class Repository
    @collection = {}

    def self.create(attributes={})
      next_id = @collection.keys.length + 1
      @collection[next_id] = Match.new(attributes.merge(id: next_id))
    end
  end
end
