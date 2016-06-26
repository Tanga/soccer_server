module SoccerHexagon
  module Players
    # This is the SQL Players Repository.  Inject this
    # repo to replace the default in memory adapter if you would like
    # to back the domain with a SQL database.  See notes in
    # Players::Player::Repository
    # for more details
    class SQLRepository
      def self.create **args
        ARRepo::ARModels::Player.create args
      end
    end
  end
end
