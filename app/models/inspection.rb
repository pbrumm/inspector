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
end
