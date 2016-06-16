class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.time :time
      t.integer :player_id
      t.integer :team_id
      t.integer :match_id
    end
  end
end
