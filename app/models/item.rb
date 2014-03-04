class Item < ActiveRecord::Base
	has_many :scores
  accepts_nested_attributes_for :scores
end