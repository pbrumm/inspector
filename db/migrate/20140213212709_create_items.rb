class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :category
      t.string :sub_category
      t.string :name
      t.string :explanation
      t.integer :scoring
      t.integer :high_score
      t.boolean :all_or_nothing

      t.timestamps
    end
  end
end
