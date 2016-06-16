module Players
  class Repository
    @collection = {}

    def self.create(attributes={})
      next_id = @collection.keys.length + 1
      @collection[next_id] = Players::Player.new(attributes.merge(id: next_id))
    end

    # def self.read id
    #   @collection[id]
    # end

    # def self.update id, attributes
    #   player = @collection[id]

    #   attributes.each do |key, value|
    #     player.send("#{key}=", value)
    #   end

    #   player
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
