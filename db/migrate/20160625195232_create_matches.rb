class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :datetime
      t.integer :pitch_id
    end
  end
end
