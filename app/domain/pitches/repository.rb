module Pitches
  # In memory repo for Pitches
  class Repository
    @collection = {}

    def self.create(attributes={})
      next_id = @collection.keys.length + 1
      @collection[next_id] = Pitches::Pitch.new(attributes.merge(id: next_id))
    end

    # def self.read id
    #   @collection[id]
    # end

    # def self.update id, attributes
    #   pitch = @collection[id]

    #   attributes.each do |key, value|
    #     pitch.send("#{key}=", value)
    #   end

    #   pitch
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
