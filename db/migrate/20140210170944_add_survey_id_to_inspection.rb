class AddSurveyIdToInspection < ActiveRecord::Migration
  def change
    add_column :inspections, :survey_id, :integer
  end
end
