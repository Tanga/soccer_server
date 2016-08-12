class SoccerHexagon
  module UseCases
    # The objective of use case patterns is to
    # bridge the gap between business and
    # system models without altering requirements
    # contents nor preempting architectural options.

    class CreateATeam
      attr_accessor :errors, :id

      def initialize(repositories=Utilities::Repositories.new)
        @repositories = repositories
        @errors = []
      end

      def call(name:)
        @name = name
        tap do
          validate
          create_team if errors.empty?
        end
      end

      private

      attr_accessor :name, :repositories

      def validate
        errors << "A team must have a name" unless name
      end

      def create_team
        @id = repositories[:teams].create(name: name).id
      end
    end
  end
end
