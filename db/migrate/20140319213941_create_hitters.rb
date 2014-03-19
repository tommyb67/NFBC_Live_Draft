class CreateHitters < ActiveRecord::Migration
  def change
    create_table :hitters do |t|
      t.integer :player_id
      t.string :name
      t.string :pos1
      t.string :pos2
      t.string :pos3
      t.integer :ab
      t.integer :run
      t.integer :hit
      t.integer :hr
      t.integer :rbi
      t.integer :sb
      t.float :avg
      t.float :zola_mix12
      t.integer :zola_rank
    end
  end
end
