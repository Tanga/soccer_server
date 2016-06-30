class SoccerHexagon
  module Matches
    # This is the default "in memory" Matches Repository.
    # When developing the domain, the in-memory repo makes it things fast to test
    # without mocking.  A repository is only able to do operations on the aggregate
    # head (Matches::Match).  There
    # can be only one repository per module in the domain.
    class Repository
      @collection = {}

      def self.create(attributes={})
        next_id = (@collection.keys.length + 1).to_s
        @collection[next_id] = Match.new(attributes.merge(id: next_id))
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

      def self.query
        @collection.values
      end
    end
  end
end
