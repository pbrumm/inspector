class Item < ActiveRecord::Base
	belongs_to :survey
	has_many :scores
  accepts_nested_attributes_for :scores
end