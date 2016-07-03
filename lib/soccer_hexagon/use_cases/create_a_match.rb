class SoccerHexagon
  module UseCases
    class CreateAMatch
      def initialize(repositories=Utilities::Repositories.new)
        @repositories = repositories
      end

      def call(on:, between:, at_location:)
        @repositories[:matches].create(
          pitch:    pitch(at_location),
          teams:    between,
          datetime: on)
      end

      private

      def pitch(id)
        @repositories[:pitches].read(id)
      end
    end
  end
end
