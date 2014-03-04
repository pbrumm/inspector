class Score < ActiveRecord::Base
	belongs_to :item
	belongs_to :inspection
	#accepts_nested_attributes_for :inspection
end
