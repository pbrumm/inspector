class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score_item
      t.integer :inspection_id
      t.integer :survey_id
      t.integer :item_id

      t.timestamps
    end
  end
end
