class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :name
    end
  end
end
