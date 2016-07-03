class SoccerHexagon
  module Domain
    module Pitches
      # This is the default "in memory" Pitches Repository.
      # When developing the domain, the in-memory repo makes it things fast to test
      # without mocking.  A repository is only able to do operations on the aggregate
      # head (Pitches::Pitch).  There
      # can be only one repository per module in the domain.
      class Repository
        @collection = {}
        @last_id = 0

        def self.create(attributes={})
          id = @last_id + 1
          @collection[id] = Pitch.new(attributes.merge(id: id))
          @last_id = id
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

        def self.query
          @collection.values
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
end
