module SoccerHexagon
  module Pitches
    # This is the default "in memory" Pitches Repository.
    # When developing the domain, the in-memory repo makes it things fast to test
    # without mocking.  A repository is only able to do operations on the aggregate
    # head (Pitches::Pitch).  There
    # can be only one repository per module in the domain.
    class Repository
      @collection = {}

      def self.create(attributes={})
        next_id = @collection.keys.length + 1
        @collection[next_id] = Pitch.new(attributes.merge(id: next_id))
      end

      def self.update id, attributes
        fixture = read(id)

        attributes.each do |field, value|
          fixture.send("#{field}=", value)
        end

        fixture
      end

      def self.read id
        @collection[id]
      end

      def self.delete(id)
        @collection.delete(id)
      end

      def self.delete_all
        @collection = {}
      end
    end
  end
end
