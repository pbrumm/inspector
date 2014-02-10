class Inspection < ActiveRecord::Base
  resourcify

  belongs_to :site
  belongs_to :survey
end
