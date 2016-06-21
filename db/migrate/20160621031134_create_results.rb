class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.datetime :time
    end
  end
end
