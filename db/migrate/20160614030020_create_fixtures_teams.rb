class CreateFixturesTeams < ActiveRecord::Migration
  def change
    create_table :fixtures_teams do |t|
      t.integer :fixture_id
      t.integer :team_id
    end
  end
end
