class Inspection < ActiveRecord::Base
  resourcify

  belongs_to :site
  belongs_to :survey

  has_many :scores
  accepts_nested_attributes_for :scores

  validates_presence_of :name
end
