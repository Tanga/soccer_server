class SoccerHexagon
  module UseCases
    # The objective of use case patterns is to
    # bridge the gap between business and
    # system models without altering requirements
    # contents nor preempting architectural options.

    class CreateAMatch
      attr_accessor :errors, :id

      def initialize(repositories=Utilities::Repositories.new)
        @repositories = repositories
        @errors = []
      end

      def call(on:, between: [], at_location:)
        tap do
          @on          = on
          @between     = between
          @at_location = at_location

          get_pitch
          get_teams
          run_validations
          create_match
        end
      end

      private

      attr_accessor :at_location, :between, :on, :teams, :pitch, :repositories

      def run_validations
        errors << "Please supply a pitch id for the 'at_location' parameter" unless at_location
        errors << "Please supply 2 team ids for the 'between' parameter" if between.nil?
        errors << "2 teams must compete in a match" if !between.nil? && between.length < 2
        errors << "Only 2 teams can compete in a match" if !between.nil? && between.length > 2
        errors << "A date value was not supplied for 'on'" unless on
        errors << "Could not find one or more teams" unless @teams.compact.length == 2
        errors << "Could not find a pitch" unless pitch
      end

      def create_match
        return unless errors.empty?
        @id = repositories[:matches].create(
          pitch:    pitch,
          teams:    teams,
          datetime: on).id
      end

      def get_teams
        return unless between
        @teams = between.map do |team_id|
          repositories[:teams].read(team_id)
        end
      end

      def get_pitch
        @pitch = repositories[:pitches].read(at_location)
      end
    end
  end
end
