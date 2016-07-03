class SoccerHexagon
  module UseCases
    # The objective of use case patterns is to
    # bridge the gap between business and
    # system models without altering requirements
    # contents nor preempting architectural options.

    class CreateAMatch
      def initialize(repositories=Utilities::Repositories.new)
        @repositories = repositories
        @errors = []
      end

      def call(on:, between:, at_location:)
        tap do
          @errors << 'No location was supplied'

          pitch = get_pitch(at_location)
          create_match(pitch, between, at_location)
        end
      end

      private

      def create_match(pitch, between, on)
        @repositories[:matches].create(
          pitch:    pitch,
          teams:    between,
          datetime: on)
      end

      def get_pitch(id)
        @repositories[:pitches].read(id)
      end
    end
  end
end
