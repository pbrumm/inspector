class AddSurveyIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :survey_id, :integer
  end
end
