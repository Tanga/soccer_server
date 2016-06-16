module Junks
  class Repository
    @collection = {}

    def self.create(attributes={})
      next_id = @collection.keys.length + 1
      @collection[next_id] = Junk.new(attributes.merge(id: next_id))
    end
  end
end
