class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :pitch_id
      t.integer :result_id
      t.integer :match_id
      t.date    :date
    end
  end
end
