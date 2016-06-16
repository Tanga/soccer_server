class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :pitch_id
    end
  end
end
