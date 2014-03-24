class Inspection < ActiveRecord::Base
  resourcify

  include RollbackLogger

  belongs_to :site
  belongs_to :survey

  has_many :scores
  accepts_nested_attributes_for :scores

  #validates_presence_of :name

  before_create do |inspection|
  	inspection.name = Survey.find(inspection.survey_id).name
  end

  after_create do |inspection|
    items = Item.where(survey_id: inspection.survey_id)
    items.each do |item|
      Score.create(score_item: item.high_score, item_id: item.id, inspection_id: inspection.id)
    end
  end
end
